Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E555318EF5;
	Wed,  7 Jan 2026 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767814683; cv=none; b=ZMcQ+skkMRg0XLUWRx9qng095B3RSLc7LB5muc3R8HQHchOncUr61qkhK88/WjPisHIwylsF5HoppuXNRcjv31d6dpR0Q1PlNeuFbGBj1nOfoR2b657VGKZb0NzqBzu5OCtIfcJXcy3ubmO/wZqDW35Fk/BlgNfWnW7F1wGigN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767814683; c=relaxed/simple;
	bh=dS7+wC/J/N4NPj+M59OGoF1CMuagn2uO6v6kqhKO6ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/+kYhyx4+16HGGkyLduTOJrPyVreZkQDsLz11CLNczM5Q0w0Q+geR/Z0k9+N1waoeLopjLDJkXtTdWIngABAvCCISpYxFYgRqEYhU1y7zCUDC/PzxXdoG37FBc0tuKtm0MO4LVS3xUd3sCub9jw8dB8P2+eHDMDK/bhNVUmB5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OWwGoY6h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OWwGoY6h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEA9C4CEF1;
	Wed,  7 Jan 2026 19:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767814682;
	bh=dS7+wC/J/N4NPj+M59OGoF1CMuagn2uO6v6kqhKO6ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWwGoY6hJdViSG6iRV0glBiuy0hzEzrSAYxm6pgvElxvQw7PIzyZb/3TT7AxcbhTo
	 TUxKaXNtOp+EiCLr5CBCbmYKi4KjvNqm9irZBdjQQpOM7C0BhxucB3gNp4FqP6HjtL
	 tRz/AcQeiIMh3m9H6LPQ5SxdQZC3lYyS8tWKHwl0=
Date: Wed, 7 Jan 2026 20:37:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
	aou@eecs.berkeley.edu, bagasdotme@gmail.com,
	catalin.marinas@arm.com, conor+dt@kernel.org, corbet@lwn.net,
	dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org, dev@kael-k.io, haren@linux.ibm.com,
	heiko@sntech.de, jose@osyx.tech, kever.yang@rock-chips.com,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com, mani@kernel.org, nathan@kernel.org,
	neil.armstrong@linaro.org, palmer@dabbelt.com, pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
	will@kernel.org
Subject: Re: [PATCH v2 0/6] virt: Add Bao hypervisor IPC and I/O dispatcher
 drivers
Message-ID: <2026010746-usual-rentable-4746@gregkh>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>

On Wed, Jan 07, 2026 at 04:28:23PM +0000, joaopeixoto@osyx.tech wrote:
> From: João Peixoto <joaopeixoto@osyx.tech>
> 
> This series introduces support for Bao hypervisor guest-side drivers
> under drivers/virt/bao, along with the associated Device Tree bindings,
> UAPI headers, and MAINTAINERS entries.
> 
> Bao is a lightweight static-partitioning hypervisor for embedded and
> safety-critical systems. This series adds:
> - Bao IPC shared memory driver: Enables Linux guests to communicate
> with each other via shared memory regions.
> - Bao I/O Dispatcher driver: Allows Bao VMs to share I/O devices using
> device paravirtualization (VirtIO).
> 
> Key updates in this version to align with upstream requirements:
> 1. Switched to misc device API: Removed all cdev, class, and
> alloc_chrdev_region code in favor of misc_register() for simpler,
> standard device management.
> 2. Clean kernel style and formatting: All code passes checkpatch.pl,
> with consistent variable declaration, function naming, and comment style.
> 3. Architecture abstraction: Consolidated ARM, ARM64, and RISC-V hypercall
> logic into architecture-specific headers, removing in-driver #ifdefs.
> 4. Commit messages: Now concise and Linux-kernel-style, describing
> behavior and impact clearly.
> 5. Device Tree compliance: Fixed all make dt_binding_check errors to
> ensure DT binding correctness.
> 
> This series has been validated on Linux guests running under Bao
> hypervisor, confirming correct initialization, IPC shared-memory
> read/write operations, and I/O Dispatcher functionality for
> backend VMs.
> 
> Feedback and review from maintainers of virtualization,
> architecture-specific code (ARM, ARM64, RISC-V), Device Tree
> bindings, and UAPI are welcome.
> 
> João Peixoto (6):
>   dt-bindings: Add Bao IPC shared memory driver binding
>   virt: bao: Add Bao IPC shared memory driver
>   dt-bindings: Add Bao I/O dispatcher driver binding
>   virt: bao: Add Bao I/O dispatcher driver
>   virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common header
>   MAINTAINERS: Add entries for Bao hypervisor drivers, headers, and DT
>     bindings
> 
>  .../bindings/bao/bao,io-dispatcher.yaml       |  75 ++++
>  .../devicetree/bindings/bao/bao,ipcshmem.yaml |  82 ++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>  MAINTAINERS                                   |  13 +
>  arch/arm/include/asm/bao.h                    |  60 +++
>  arch/arm64/include/asm/bao.h                  |  60 +++
>  arch/riscv/include/asm/bao.h                  |  60 +++
>  drivers/virt/Kconfig                          |   2 +
>  drivers/virt/Makefile                         |   2 +
>  drivers/virt/bao/Kconfig                      |   5 +
>  drivers/virt/bao/Makefile                     |   4 +
>  drivers/virt/bao/io-dispatcher/Kconfig        |  15 +
>  drivers/virt/bao/io-dispatcher/Makefile       |   4 +
>  drivers/virt/bao/io-dispatcher/bao_drv.h      | 361 ++++++++++++++++
>  drivers/virt/bao/io-dispatcher/dm.c           | 405 ++++++++++++++++++
>  drivers/virt/bao/io-dispatcher/driver.c       | 185 ++++++++
>  drivers/virt/bao/io-dispatcher/intc.c         |  64 +++
>  drivers/virt/bao/io-dispatcher/io_client.c    | 405 ++++++++++++++++++
>  .../virt/bao/io-dispatcher/io_dispatcher.c    | 179 ++++++++
>  drivers/virt/bao/io-dispatcher/ioeventfd.c    | 323 ++++++++++++++
>  drivers/virt/bao/io-dispatcher/irqfd.c        | 314 ++++++++++++++
>  drivers/virt/bao/ipcshmem/Kconfig             |   8 +
>  drivers/virt/bao/ipcshmem/Makefile            |   3 +
>  drivers/virt/bao/ipcshmem/ipcshmem.c          | 252 +++++++++++
>  include/linux/bao.h                           |  44 ++
>  include/uapi/linux/bao.h                      |  98 +++++
>  27 files changed, 3027 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>  create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
>  create mode 100644 arch/arm/include/asm/bao.h
>  create mode 100644 arch/arm64/include/asm/bao.h
>  create mode 100644 arch/riscv/include/asm/bao.h
>  create mode 100644 drivers/virt/bao/Kconfig
>  create mode 100644 drivers/virt/bao/Makefile
>  create mode 100644 drivers/virt/bao/io-dispatcher/Kconfig
>  create mode 100644 drivers/virt/bao/io-dispatcher/Makefile
>  create mode 100644 drivers/virt/bao/io-dispatcher/bao_drv.h
>  create mode 100644 drivers/virt/bao/io-dispatcher/dm.c
>  create mode 100644 drivers/virt/bao/io-dispatcher/driver.c
>  create mode 100644 drivers/virt/bao/io-dispatcher/intc.c
>  create mode 100644 drivers/virt/bao/io-dispatcher/io_client.c
>  create mode 100644 drivers/virt/bao/io-dispatcher/io_dispatcher.c
>  create mode 100644 drivers/virt/bao/io-dispatcher/ioeventfd.c
>  create mode 100644 drivers/virt/bao/io-dispatcher/irqfd.c
>  create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
>  create mode 100644 drivers/virt/bao/ipcshmem/Makefile
>  create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c
>  create mode 100644 include/linux/bao.h
>  create mode 100644 include/uapi/linux/bao.h
> 
> -- 
> 2.43.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
