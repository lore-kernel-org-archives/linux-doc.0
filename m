Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E939C3B5304;
	Wed, 29 Apr 2026 22:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777502335; cv=none; b=sJdiQt9L+SLyZ9U/kgvi50tKfbqC8NPYNy63vk9Dhh+VxZlU69XA5rDq3ZQSUYGHG25sRH6oKEbfz+WPasqmDEM6arr9kQcKeJRvjLCTct2xcNv/13M60FYSMEoO2cYeS/X4hmtAxpNihcKzACM6V08wafS0xU6BF0RLWzeTCKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777502335; c=relaxed/simple;
	bh=JeIxuAb8SH/xuxW5Wo8xysK6JtR03A002Veo7+WK+ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsoA0OpfqDfxQ7dJeyzMLDDByXguFPS5H4ZK+97v+wywsR6raOTA/zb9NHGK2jwO+NV0E7oE9aWgeBx8CfVy0n0oJ8xwFXe0Ns2eejPf0sflNrd6NVilIG6K7Ya9IxgT/EQ4cRKlrsjEavXuIuCVmnYlPlDSssHBTkxufGOLEfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=g0fQ0gCa; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g0fQ0gCa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=cdmAmKqP8GW4J1q3ExuHiUk5O5/GX0ScbB1+T53Z1KA=; b=g0fQ0gCa7dqY+eOwCaKT1si95O
	Fd9uDp6hbYapNR6TXn4PRGQrpRa0egWiwJjyO8FU3/q289JUn9JoDdx3uIlJN0hXAmEl1G0RaAFhR
	Ry4kZNJIAvX9qsFkIUpN4fvZVN8tO+WWdDOPPxDS0q2r4E8lsFI/aJ48nq2z7s1sUmsi63Wb/yEWs
	6Aq0XUPY7mSDmfGNmj1GMuSyRTlp80VSFGz3a83X1Pg6TEvSoWw5yjyXPFSjxq80L4ICkzJsEqPiq
	FJtIl2G2nM6qQnuIoLEQdGIaC3B/3YOnq0c7TDux0SdLdHM9DOkVnN980pMr9SjefIHj19gOYLEpC
	BgoGpFnw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIDYN-00000004HXn-404I;
	Wed, 29 Apr 2026 22:38:48 +0000
Message-ID: <bae95436-6685-4fe7-b795-feba4192cb58@infradead.org>
Date: Wed, 29 Apr 2026 15:38:46 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: riscv: cmodx: fix typos
To: Avi Radinsky <avi.radinsky@tennr.com>, palmer@dabbelt.com,
 pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, corbet@lwn.net
Cc: linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <391d16fb-5f11-45fa-8f3b-1debe095695e@tennr.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <391d16fb-5f11-45fa-8f3b-1debe095695e@tennr.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/29/26 3:35 PM, Avi Radinsky wrote:
> Fix typos in the dynamic ftrace section: atmoic -> atomic (twice),
> pacthable -> patchable, derect -> directed.
> 
> Signed-off-by: Avi Radinsky <avi.radinsky@tennr.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/arch/riscv/cmodx.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
> index 40ba53bed..cbfa812a1 100644
> --- a/Documentation/arch/riscv/cmodx.rst
> +++ b/Documentation/arch/riscv/cmodx.rst
> @@ -21,13 +21,13 @@ call at each patchable function entry, and patches it dynamically at runtime to
>  enable or disable the redirection. In the case of RISC-V, 2 instructions,
>  AUIPC + JALR, are required to compose a function call. However, it is impossible
>  to patch 2 instructions and expect that a concurrent read-side executes them
> -without a race condition. This series makes atmoic code patching possible in
> +without a race condition. This series makes atomic code patching possible in
>  RISC-V ftrace. Kernel preemption makes things even worse as it allows the old
>  state to persist across the patching process with stop_machine().
>  
>  In order to get rid of stop_machine() and run dynamic ftrace with full kernel
>  preemption, we partially initialize each patchable function entry at boot-time,
> -setting the first instruction to AUIPC, and the second to NOP. Now, atmoic
> +setting the first instruction to AUIPC, and the second to NOP. Now, atomic
>  patching is possible because the kernel only has to update one instruction.
>  According to Ziccif, as long as an instruction is naturally aligned, the ISA
>  guarantee an  atomic update.
> @@ -36,8 +36,8 @@ By fixing down the first instruction, AUIPC, the range of the ftrace trampoline
>  is limited to +-2K from the predetermined target, ftrace_caller, due to the lack
>  of immediate encoding space in RISC-V. To address the issue, we introduce
>  CALL_OPS, where an 8B naturally align metadata is added in front of each
> -pacthable function. The metadata is resolved at the first trampoline, then the
> -execution can be derect to another custom trampoline.
> +patchable function. The metadata is resolved at the first trampoline, then the
> +execution can be directed to another custom trampoline.
>  
>  CMODX in the User Space
>  -----------------------

-- 
~Randy
