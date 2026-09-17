Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641F345198C
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 23:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686485; cv=none; b=fC1iKPGw3YcdSoKa1KBVga+I3LdejPifmEMZpAHPGVQm+y9QUfojSNe3xroXF9yMm35wpJibXngq0dgjclHC2Inlw7xE/wBBZ9nZgN3FDt3TNq5nWjJoBY/anAQ8bqHyH11XTz3yuKmcDoOjiI3KlK0qLr8y/30hNulJteX6mrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686485; c=relaxed/simple;
	bh=Qyk7IaW5D9rtnfADN57JI/cA1ywHq81PbOJcwVPWGSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhEhGQUYQSaDEZQiWGyESbHhTDOc1Sp4IUrn0MSEjoZLYjkzFCa2vSIepzgNIEs1g0FaZqjz2WvRXdAcbbrfX7sp3yCdHHQL9COFBuXe8yO91PewPBb8rauSQO94naghmB5w9l0nO8qpUdyW2QPQaJ6mwp0OBiH1DonIsHVsKfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LMwQq6gH; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LMwQq6gH"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2d6e954afbdso546565ad.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 16:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686478; x=1790291278;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KkBkFvNjZkmBQ+ciR5KjrTSHBNZ+IYK3WHfHxYYYMK8=;
        b=D6ZL95P2JJ3G1rEIiCLmaAB2OWA+1hYAi1oqMUA4lkMJANYkoxOj2LDXAErKeVdMGm
         Ch6U8wb+1Q+hEEmhH2oA4q4pYq6Y+k5lFKWwNkG5y6w44bD1UGXljj76gOhOP2Srkj2C
         W7CG4VWhtR7PdO9w6yq93gkmDI+8iazK8Tr08E7sm+juGmHZ/dXIKIhdMkvA63cGVajl
         7TapLcjFL+k+PcZeoZnkVSYhh/SunBmzDJVvfWTKycu8ilXUABjAJFDYvxp5kcutp+xb
         19+/AUmtQEgRIX9aBk2u/MAeP2EZiXPVQ+AEAxJu0Nvh7SmqFNIcQzT7ttazgGSegJvb
         xxjg==
X-Forwarded-Encrypted: i=1; AKwUvByp9GqxscwC2N9qQmIUOTUos0yUjaF5G3lTB9jCPgKdJMoAtoaK2K3DSUqOrdcOsmd0+lqw74/7bGU=@vger.kernel.org
X-Gm-Message-State: AFuF++mkK3VIneWLVqV1wqDluXAakOSKJ1iNNZr9jbVhfiBoE0MUYFGa
	MR5aw2BTmp8UEyQnZO4p+V38GeTCnxriKbLL+a+qUOha/GuR6x1IGeL1XHyvToDNMigaFXOdU9O
	Dil9NrXICEtw/9BS+Fiy0P4uWM/O+YvDMGBHwjh3EMeJpy/U6/A/uv0qpw0WzU3EtzcQL2CMuMz
	JvKK7oTa282XsEJJAPukjxBbQgUY+b7VaNG9WWPf4nV9I34ym+vElj2nojMMqycJ7TG41+frYvc
	dR1GyKR8l3bMwE3s1o+
X-Gm-Gg: AYBFou3QlcVoheQZW9txXeil3lWG4bumV5ueBX5IWG8/33LfQfvqeCzoo9cyA5Lac6T
	+Cey5KYMunPYMzaqh1LGFoeGwd5y8/pesRk9LdSAu5Anu1YsGKv+qxooKK5h2iRCTG1a6CEb8Vv
	8owjHZwMUXDlGyqA9KKIHU+Uz9T8c+rrAbvei7ODal9aUhrHOCo7vTm+WdOz9iYwu8tHMxJUpdC
	DuW/Paj9Efa6zuiInSyclmHf3efllz9vETw/KZRcZzHiCDUErG3U1teGAcmob9f9LHYf+MQgupt
	Nb/YESvcQN8bCD2VFdY/i4oQSJiPzFah9tJhcpyTUd3QXOb8mv5/9Lkf9pk81kkBoNuEb5PoAnH
	z1utsHF23cnCrv7in8Dbi0Btu040B8Bkuy3QnbKGexNcZNigEr3W88sB8q4NpL2MSuwayWWYbD+
	NoykcJnV6pBHHSxYzoogTBWe4GpacAs6QuZhVNulDD
X-Received: by 2002:a05:6a20:3d8b:b0:3cc:b26a:7686 with SMTP id adf61e73a8af0-3dd8c3360cemr1079083637.6.1789686477272;
        Thu, 17 Sep 2026 16:07:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-98.dlp.protect.broadcom.com. [144.49.247.98])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc50abc1222sm3291275a12.3.2026.09.17.16.07.56
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 16:07:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so55234a12.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 16:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789686475; x=1790291275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkBkFvNjZkmBQ+ciR5KjrTSHBNZ+IYK3WHfHxYYYMK8=;
        b=LMwQq6gHC980CO7El8uqg36zPDsHHths7iVx7tb+okf6U1MYkqmeaIVKpbDTwf2oiZ
         cRN2Hv4BkRwsnXx4ziNSm8NPo1HwayxmQ0ZksPbzhgzR0gJ48FlSOMYrchFh7hNiww42
         b//Ud1J5ALBxuMHMYMpk3kOmSAaxBxXMGlzE8=
X-Forwarded-Encrypted: i=1; AKwUvBwtgytqHknZs2TVLQxqHOzPDUt2VEhkVFA94lUEgcSSpXjWTGezkzjsaCxm0TJ3kLY1gnZkBAvnPNM=@vger.kernel.org
X-Received: by 2002:a17:90b:1e04:b0:39e:4c80:f680 with SMTP id 98e67ed59e1d1-39e54f3dba9mr1123035a91.31.1789686474939;
        Thu, 17 Sep 2026 16:07:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1e04:b0:39e:4c80:f680 with SMTP id 98e67ed59e1d1-39e54f3dba9mr1122991a91.31.1789686474393;
        Thu, 17 Sep 2026 16:07:54 -0700 (PDT)
Received: from [10.211.247.235] ([216.221.25.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm21060020eec.1.2026.09.17.16.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 16:07:54 -0700 (PDT)
Message-ID: <58026818-7737-4560-be64-5cf22f2d8d69@broadcom.com>
Date: Thu, 17 Sep 2026 16:07:56 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] x86/vmware: Preserve panic diagnostics in
 vmware.log
To: Zack Rusin <zack.rusin@broadcom.com>, Borislav Petkov <bp@alien8.de>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
 Petr Mladek <pmladek@suse.com>, Joel Granados <joel.granados@kernel.org>,
 Baoquan He <baoquan.he@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, virtualization@lists.linux.dev,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 John Ogness <john.ogness@linutronix.de>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Dave Young <ruirui.yang@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Bo Gan <bo.gan@broadcom.com>,
 Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
 kexec@lists.infradead.org, linux-doc@vger.kernel.org
References: <cover.1788414671.git.zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <cover.1788414671.git.zack.rusin@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/8/26 11:07 AM, Zack Rusin wrote:
> A virtual machine may have neither guest-local persistent storage nor
> working userspace after a panic. The host's vmware.log remains available
> after the VM terminates, and a production encrypted guest is the only
> component able to export readable panic text. Hyper-V already provides
> this class of host-persistent panic reporting.
> 
> Add a panic-only VMware logger that copies the newest 4 KiB of the kernel
> log and sends it with bounded low-bandwidth RPC work. Ordinary guests
> enable text transfer by default; encrypted guests require an administrator
> to opt in through kernel.vmware_record_panic_msg. A separate late dumper
> reports the structured crash event after built-in dumpers and suppresses
> the event while a crash kernel is loaded, because a configured VMware host
> may terminate the VM before the reporting hypercall returns.
> 
> Patch 4 makes panic diagnostics run before kdump by default on VMware
> guests. This follows existing platform uses of
> crash_kexec_post_notifiers, with Hyper-V as the closest guest-reporting
> precedent. Unlike Hyper-V, VMware exposes no capability bit for this
> behavior. An explicit crash_kexec_post_notifiers=0 still wins, and patch 4
> can be dropped without affecting patches 1 through 3.
> 
> This replaces patches 2 and 3 of Alexey's v2 posting:
> https://lore.kernel.org/all/20260309235250.2611115-1-alexey.makhalov@broadcom.com/
> 
> The intended merge path is tip's x86/vmware branch. Boris please review the
> VMware transport and policy. Petr and John, please review the panic-only
> dumper use and registration ordering. Joel and Kees, please review the
> sysctl. Baoquan and the KEXEC/KDUMP team, please review the 
> loaded-crash-kernel guard and the default in patch 4.
> 
> Zack Rusin (4):
>   x86/vmware: Add a bounded panic log sender
>   x86/vmware: Add the vmware_record_panic_msg sysctl
>   x86/vmware: Report guest crashes after kmsg dumpers
>   x86/vmware: Run panic diagnostics before kdump by default
> 
>  Documentation/admin-guide/sysctl/kernel.rst |  14 ++
>  arch/x86/include/asm/vmware.h               |   2 +
>  arch/x86/kernel/cpu/vmware.c                | 245 ++++++++++++++++++++
>  3 files changed, 261 insertions(+)
> 
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935


LGTM for the series

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
