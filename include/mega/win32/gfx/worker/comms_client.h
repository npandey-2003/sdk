#pragma once

#include "mega/gfx/worker/comms.h"
#include "mega/win32/gfx/worker/comms.h"
#include <windows.h>

namespace mega {
namespace gfx {

class Win32NamedPipeEndpointClient : public Win32NamedPipeEndpoint
{
public:
    Win32NamedPipeEndpointClient(HANDLE h, const std::string& name) : Win32NamedPipeEndpoint(h, name) {}

private:
    Type type() const { return Type::Client; }
};

class WinGfxCommunicationsClient : public IGfxCommunicationsClient
{
public:
    WinGfxCommunicationsClient(const std::string& pipeName)
        : mPipeName(pipeName)
    {

    }

    CommError connect(std::unique_ptr<IEndpoint>& endpoint) override;

private:
    CommError doConnect(LPCTSTR pipeName, HANDLE &hPipe);

    CommError toCommError(DWORD winError) const;

    std::string mPipeName;
};

} // end of namespace
}