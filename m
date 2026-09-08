Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7410F5908D3
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 18:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890856; cv=none; b=Knxv34+cYPOtfXW1zr5s3cdaM+zTjDa80Vmk3OUrW0b8xbxoAju2jnORJxT3dWI51UKVdp/HC+JJSl2ZA9XjyxgMJt132roVwOZSngVKcYwLSP7jhxbHc8phASmns51Yyb1PmXZXeKuDLTAdea2DQoJTR+sIAAWxMeQhsyeLAJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890856; c=relaxed/simple;
	bh=aVct0QQQt2YqktuHDZgb/IGehlIFoCNOWmk87ahbsdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YjTBLog+BC4PK4XPa6d9xAiSYkRjh0l9UiEjA/3AHRzKd5l1xNMQGZk+06iMgXptTGBPDSEODs/QB17SdqlV0ScPHM0yL/P2Bho7rGxET3PYPTW8I16pTfVYh4IjcUFB3zQNKN7VL8FDFUihioMGEpPe5hBF18ZcWlhVDKLbfcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HcqAcyVl; arc=none smtp.client-ip=209.85.215.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HcqAcyVl"
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so3778657a12.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 11:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890849; x=1789495649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r+VLJNR2ClH5aaw8GL8jeSbQjtC7qAwKNhxP9YK5biY=;
        b=K6emKRHrYkZwrbJEfMpWpMKWjiu7+PQBf39ongNKOaEHLehvXdItsxDftlePcADu29
         OY2DSAf3iXHIw16U5srNhwCL3yeCUQD2/5qKogsMB/OmULnWgdIntFg4ImHu8gPEc2Sz
         emkEerWK5CNy1QP0PpZs20ctYz7TS+5ZJpFl9J0vCapmzoZpRXz+e/nZC+0e3rvj8Fk2
         DcNQskd7t/xmBpf0l03rrGOe/BVESBtWdfPKrlyaOf+n8k/4/CKQIBcaLxtGI11n+8Eh
         tF6NrIVMawbYbbtqWL/2BD0TuyqVuSxqG1l+9gE8WMAA9ps9/cae6BOCPiYdL4CmkEg2
         DCEw==
X-Forwarded-Encrypted: i=1; AKwUvBwBHmpoLS5HxHujrDT9Iay5OHmW01rf/2xFttUzHcPzer047DO7cWtMryO5B8KarHEacPBMcuafMhw=@vger.kernel.org
X-Gm-Message-State: AFuF++kOWla8LcL1Q+NzbKtD4FKlfYgCYvp6fdggNjoxz3udEuwPwSrh
	kXyVQ+LNXJatziY6nJcCmr9jaC/abW5NTK3Gw7/xcB4URknMnr8r7YffyjF5ClRzACHNeUieV9G
	N/2JeiPShMYhYy41kQogZc0qxTsW7v7tKWGLeYXrxG7hUBOkjjY2IjNSDBRZGd1MO+cIAOlvq8j
	noU8vnJNtUkQ08epgP9aqTO/EWzjAAQBNkjMHWzgbkFLFVyn0Jbn1MsKs+uSb1vFvK09/G6kVa9
	gtEFByTlLMF
X-Gm-Gg: AYBFou2FAhZxRgJ3qJmJeF6RQv/8w4E19DRNpnGCAkRnUdqnI0A6zivaX+m3jD60CCj
	9E49hiAqeUK6DrInEzMDhL+6+TOdfcaWek+ROecqg/saxlyS3RseYClUcI+TCCW7cLmFtygVYgR
	R/GdiE0LFAF2GPu/HnvIktmG0HrJDyjQxl9PNRvZJOHaZFzo3O3/aVtKytaTtc8wHmP7C6O92u3
	5z2EGwBDqMrQhQcUn0VKH6cB9h+OlGw09Nmu2/gPsoHnE3Z2pv1ZRFDuUh6Nt7yFTcHoYB7bJXN
	iMjjDDrOTc8YorOHE4nE9oGsWVu+jC0HWLxtwMUdHb5+OsCjkJMKJnmV7iyZukTL1d41fMG4ySZ
	ZeiGBUXVouH3fsMxYQYkLhFUuJpyWdwor8aZy5djxzFeA3hbQVTRbdaPgATlvKRJMNq0rpfozYz
	ZIDmJqOA+ttpHAc6AV9n9rn8gDH00FFC+l
X-Received: by 2002:a05:6a21:6e8d:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3da39fd290fmr48352680637.14.1788890849140;
        Tue, 08 Sep 2026 11:07:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-14324f7a9a3sm472785c88.4.2026.09.08.11.07.28
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:07:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-670fbb96c4aso1926958d50.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788890847; x=1789495647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+VLJNR2ClH5aaw8GL8jeSbQjtC7qAwKNhxP9YK5biY=;
        b=HcqAcyVllebQpHp3hz3fhUeGLt/N3JiWe9zv0eAvRZK0Tvity3ySFzAwHa60PIICax
         nuyLYhEBAmNMbpaVLyQ0l50P/WRlTWgSCMiwuI5JQd1O+2mj0RRtih4aik1GbtCwUW0m
         wV5PlhurUeHW1C5afcB2z5hELrflePhqXn/XQ=
X-Forwarded-Encrypted: i=1; AKwUvBwW0bmMnxdTn8COBOp7MmMnYvQ0mCi5K7ktcj1BvUU0eCTVhmQ7OmPU5fTFSmJPpKVcKpgs3ot/acA=@vger.kernel.org
X-Received: by 2002:a53:e8c5:0:b0:66f:c1be:84d8 with SMTP id 956f58d0204a3-66fc1be866cmr7220600d50.70.1788890847334;
        Tue, 08 Sep 2026 11:07:27 -0700 (PDT)
X-Received: by 2002:a53:e8c5:0:b0:66f:c1be:84d8 with SMTP id 956f58d0204a3-66fc1be866cmr7220569d50.70.1788890846854;
        Tue, 08 Sep 2026 11:07:26 -0700 (PDT)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm27114866d6.20.2026.09.08.11.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:07:25 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Joel Granados <joel.granados@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1 0/4] x86/vmware: Preserve panic diagnostics in vmware.log
Date: Tue,  8 Sep 2026 14:07:12 -0400
Message-ID: <cover.1788414671.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

A virtual machine may have neither guest-local persistent storage nor
working userspace after a panic. The host's vmware.log remains available
after the VM terminates, and a production encrypted guest is the only
component able to export readable panic text. Hyper-V already provides
this class of host-persistent panic reporting.

Add a panic-only VMware logger that copies the newest 4 KiB of the kernel
log and sends it with bounded low-bandwidth RPC work. Ordinary guests
enable text transfer by default; encrypted guests require an administrator
to opt in through kernel.vmware_record_panic_msg. A separate late dumper
reports the structured crash event after built-in dumpers and suppresses
the event while a crash kernel is loaded, because a configured VMware host
may terminate the VM before the reporting hypercall returns.

Patch 4 makes panic diagnostics run before kdump by default on VMware
guests. This follows existing platform uses of
crash_kexec_post_notifiers, with Hyper-V as the closest guest-reporting
precedent. Unlike Hyper-V, VMware exposes no capability bit for this
behavior. An explicit crash_kexec_post_notifiers=0 still wins, and patch 4
can be dropped without affecting patches 1 through 3.

This replaces patches 2 and 3 of Alexey's v2 posting:
https://lore.kernel.org/all/20260309235250.2611115-1-alexey.makhalov@broadcom.com/

The intended merge path is tip's x86/vmware branch. Boris please review the
VMware transport and policy. Petr and John, please review the panic-only
dumper use and registration ordering. Joel and Kees, please review the
sysctl. Baoquan and the KEXEC/KDUMP team, please review the 
loaded-crash-kernel guard and the default in patch 4.

Zack Rusin (4):
  x86/vmware: Add a bounded panic log sender
  x86/vmware: Add the vmware_record_panic_msg sysctl
  x86/vmware: Report guest crashes after kmsg dumpers
  x86/vmware: Run panic diagnostics before kdump by default

 Documentation/admin-guide/sysctl/kernel.rst |  14 ++
 arch/x86/include/asm/vmware.h               |   2 +
 arch/x86/kernel/cpu/vmware.c                | 245 ++++++++++++++++++++
 3 files changed, 261 insertions(+)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

