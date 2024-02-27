Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51EB53E32
	for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709018105; cv=none; b=p3jkCLJFLO8F6HBPtmzOLlUplY5TIhC2pAt1wkHahznb7XJ9/7NOC3d158Jyx2IC9FoOhCPSNps10GCz+0zYj6WIc/OJhZAWo/0dvbBgb/NgI0FSJ64OBC4BE19PMZBePsh94BFomxl+dsEAOf44vkBnAUnQraUG7ll5SyKjrP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709018105; c=relaxed/simple;
	bh=TeIqcp3WpttmFHIW3XnvocYFn3BQTg7igUcNSN1yPAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZuCln2fa0pabfTiuTGDLbT5EVzhnmO4AZgxJh6zEFmtlSfXCQdPa3f+dhJqzbWe1MeWneGLNfdjw428J7/NTnNNRnZxbr/ww4XhWuqFsLMM1zzJDR9UC2j1XmAHeGnXchPAaMwporq6aRYmEBXwexhbB5vwy/nUTZ+K1wHWQ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ceIeDVUV; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ceIeDVUV"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7d5c890c67fso1855297241.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 23:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709018103; x=1709622903; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N8vWHZRUeld7g6+ZkMc+yQ/mSTYD3W0qvbbr+ouei6I=;
        b=ceIeDVUVNIL7ycUjdxsEpWzQ8isuYHSV+AdJkxc+Ks2LQSk8d+khHa9car0Zizq1WA
         cYuzNlLwOwKMLS86ZBt02k+YO9tV7CQKmm0IFe7gDWvWLIS8pIKNiyJyE9pcfzZlTSn7
         v/JssoiUQLgeRVHVt0q5E0h/2qFLl3ASDnPiSKENEESFnSHrNAJqYWU+bOeu6im9tW4i
         AceZEF6V3BRfkIIsHz23dsXNoOQiK9/HV+TQwl4LvilpdBtZjyYX4tJ2XYd61XzedYNJ
         M/kSdiEoXaT5fFeXG2N8If34G4xKsQLcGUIhf/wUXhjQU3RJIQo70tgFw9LHodlDF0OG
         7Mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709018103; x=1709622903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8vWHZRUeld7g6+ZkMc+yQ/mSTYD3W0qvbbr+ouei6I=;
        b=NLmwQfCO/f7tznADcpJx+RCFX5LzItJUBTArjwQiwkIEFWpIjQaxtNo/BcnB9IklMZ
         ahbJlCDPqmgjp+wDVWBQlLVk+kxFsFg+jxI7wSbpILGt504VdpIO6s6AzWXgmehLRyGh
         Qpdo3CIU0hUNLFs1xFc8FkIulIpIFRWDpLUBD9EzEUNnIzJK3+4S7MwZPMybW27Q5doV
         N+O0tPopWI5pKnfByYBFYxKcKJuqqS33SgBfps4n+seRAz3NIQNrFxCKDK9cVJIBqf35
         jn6fRbpP+cOFhAGBY0PslmnKbK0l4xX20rvjj1abWiyhCi11Stba+r1ok2zjZboFsJ7/
         DLjg==
X-Forwarded-Encrypted: i=1; AJvYcCVIxp0PCFOUWD2rLUST6giRzB62FU2dMJ/OSG6bgA/QVFDg4AO/xEAO1eGtuWKXuiM4UIBHhs6Fgyw1HJXkjhwPwha19saYYUUd
X-Gm-Message-State: AOJu0YxLF9D7W30JdlBjjhgOnDFIPDAgeMmLhtSPdW6inOcWePaQvg0H
	d3NPhPLG8G3B8aXGlRx5t2vFfxiapN0A8/rEr44vZ/3H3S3gB47LIxb0r62TQaEiLusbWNYg9r0
	Zs5oUPhLOKl6O1VE2u7TVbsOL/fP+BzrdiF+a8g==
X-Google-Smtp-Source: AGHT+IETqLQ6OmJoJdnFc8F84miMDQkGhVQSfNUHRAERey1hj1gfrnCVpeEojfYJc5ISMOnuLCiw+y72t9vB98e04w8=
X-Received: by 2002:a05:6102:2751:b0:471:fc79:bf0d with SMTP id
 p17-20020a056102275100b00471fc79bf0dmr2907031vsu.2.1709018102699; Mon, 26 Feb
 2024 23:15:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223095133.109046-1-balint.dobszay@arm.com> <20240223095133.109046-4-balint.dobszay@arm.com>
In-Reply-To: <20240223095133.109046-4-balint.dobszay@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 27 Feb 2024 12:44:51 +0530
Message-ID: <CAFA6WYP4WVv2H4_2PAn_BOUpYYbG1SDcWL0Gmd6c0ECiH62c_w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Documentation: tee: Add TS-TEE driver
To: Balint Dobszay <balint.dobszay@arm.com>
Cc: op-tee@lists.trustedfirmware.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jens.wiklander@linaro.org, corbet@lwn.net, sudeep.holla@arm.com, 
	rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 15:23, Balint Dobszay <balint.dobszay@arm.com> wrote:
>
> Add documentation for the Trusted Services TEE driver.
>
> Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
> ---
>  Documentation/tee/index.rst  |  1 +
>  Documentation/tee/ts-tee.rst | 71 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/tee/ts-tee.rst
>

Acked-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/Documentation/tee/index.rst b/Documentation/tee/index.rst
> index a23bd08847e5..4be6e69d7837 100644
> --- a/Documentation/tee/index.rst
> +++ b/Documentation/tee/index.rst
> @@ -10,6 +10,7 @@ TEE Subsystem
>     tee
>     op-tee
>     amd-tee
> +   ts-tee
>
>  .. only::  subproject and html
>
> diff --git a/Documentation/tee/ts-tee.rst b/Documentation/tee/ts-tee.rst
> new file mode 100644
> index 000000000000..843e34422648
> --- /dev/null
> +++ b/Documentation/tee/ts-tee.rst
> @@ -0,0 +1,71 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=================================
> +TS-TEE (Trusted Services project)
> +=================================
> +
> +This driver provides access to secure services implemented by Trusted Services.
> +
> +Trusted Services [1] is a TrustedFirmware.org project that provides a framework
> +for developing and deploying device Root of Trust services in FF-A [2] S-EL0
> +Secure Partitions. The project hosts the reference implementation of the Arm
> +Platform Security Architecture [3] for Arm A-profile devices.
> +
> +The FF-A Secure Partitions (SP) are accessible through the FF-A driver [4] which
> +provides the low level communication for this driver. On top of that the Trusted
> +Services RPC protocol is used [5]. To use the driver from user space a reference
> +implementation is provided at [6], which is part of the Trusted Services client
> +library called libts [7].
> +
> +All Trusted Services (TS) SPs have the same FF-A UUID; it identifies the TS RPC
> +protocol. A TS SP can host one or more services (e.g. PSA Crypto, PSA ITS, etc).
> +A service is identified by its service UUID; the same type of service cannot be
> +present twice in the same SP. During SP boot each service in the SP is assigned
> +an "interface ID". This is just a short ID to simplify message addressing.
> +
> +The generic TEE design is to share memory at once with the Trusted OS, which can
> +then be reused to communicate with multiple applications running on the Trusted
> +OS. However, in case of FF-A, memory sharing works on an endpoint level, i.e.
> +memory is shared with a specific SP. User space has to be able to separately
> +share memory with each SP based on its endpoint ID; therefore a separate TEE
> +device is registered for each discovered TS SP. Opening the SP corresponds to
> +opening the TEE device and creating a TEE context. A TS SP hosts one or more
> +services. Opening a service corresponds to opening a session in the given
> +tee_context.
> +
> +Overview of a system with Trusted Services components::
> +
> +   User space                  Kernel space                   Secure world
> +   ~~~~~~~~~~                  ~~~~~~~~~~~~                   ~~~~~~~~~~~~
> +   +--------+                                               +-------------+
> +   | Client |                                               | Trusted     |
> +   +--------+                                               | Services SP |
> +      /\                                                    +-------------+
> +      ||                                                          /\
> +      ||                                                          ||
> +      ||                                                          ||
> +      \/                                                          \/
> +   +-------+                +----------+--------+           +-------------+
> +   | libts |                |  TEE     | TS-TEE |           |  FF-A SPMC  |
> +   |       |                |  subsys  | driver |           |   + SPMD    |
> +   +-------+----------------+----+-----+--------+-----------+-------------+
> +   |      Generic TEE API        |     |  FF-A  |     TS RPC protocol     |
> +   |      IOCTL (TEE_IOC_*)      |     | driver |        over FF-A        |
> +   +-----------------------------+     +--------+-------------------------+
> +
> +References
> +==========
> +
> +[1] https://www.trustedfirmware.org/projects/trusted-services/
> +
> +[2] https://developer.arm.com/documentation/den0077/
> +
> +[3] https://www.arm.com/architecture/security-features/platform-security
> +
> +[4] drivers/firmware/arm_ffa/
> +
> +[5] https://trusted-services.readthedocs.io/en/v1.0.0/developer/service-access-protocols.html#abi
> +
> +[6] https://git.trustedfirmware.org/TS/trusted-services.git/tree/components/rpc/ts_rpc/caller/linux/ts_rpc_caller_linux.c?h=v1.0.0
> +
> +[7] https://git.trustedfirmware.org/TS/trusted-services.git/tree/deployments/libts/arm-linux/CMakeLists.txt?h=v1.0.0
> --
> 2.34.1
>
