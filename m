Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC435908D3
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890878; cv=none; b=rFeXxwD/bDC0xJOwn++k2SvROpVka8GrnIoPhcz3/dg1i814Mfq259v7mao6QfTgv3ermeKItwiUn8fhXEUqcjSTByYeo6zH8sf0/ue4KJXAxzY36w9a9YD1Fl0SH85e32qq0lqoH2Wl/ZDrWlEUjXAd0iLReYh0kpcoOR39KYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890878; c=relaxed/simple;
	bh=3/G5xnGKNtyLpIWmfEvLNiG/KTtcFKselUmUIESFwoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZLOuhteLQGz8N9lMSMbdunaGky9p3lBFfuoZm783ye1Aa5IMRLgnZRLBazgXx0xo6cFX1mi0FE/z7Q6JF+CkvRtzASsR31kXcLCDx0FlZyeGJv6/E076FTrxHksA64G40Sz3Iv8xdaGI2qxrgOjQW0br7RPAaL/0y5J9O7SJlXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LPhhRCyR; arc=none smtp.client-ip=74.125.224.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LPhhRCyR"
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-66f8053e7afso3248775d50.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 11:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890863; x=1789495663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rb9I7ysehn3T8EdRE3wvUpvmDJ0lCancFwS1A6o0B9Y=;
        b=hzGtXATY/iJLgZfCPQ0u2aC/jSc72G5TrGQ64jxZQaJn4V47aMWKCfI776w2w33X51
         wCSlufGBrLettDs5bAdgRxR/PeGJLlrE/MOtXd9zl8FxoQqr68i35qsaqVxrnqz6/doe
         yRPjQkXI7Pcqcryib28iOSHKSqHKuTywgZ+/Z69mhy/cf8o5tFr31XhS+v6RHF2OOoTt
         lAYxvmBHpzkNro4GsZndK0aWpsxPFA/Z3xjivURHsp8v34DyMZGuK1cnO4b/eTujCUN0
         e6u1hF5FqGpGQQ1PuREaxCr8Kcre1/nogsIzYfLMU6CQjvqhNFMJkvqXGd88BjVlaS4d
         aMbA==
X-Forwarded-Encrypted: i=1; AKwUvBxf9bartUObbf9OaoEK8OfLkgVIQMv4NHGbaQV4hBhWNVHLun4z+uykFhZiMjK689UT2JbDA1IsGbo=@vger.kernel.org
X-Gm-Message-State: AFuF++nlbBKhh0OX2r+ZKj438f3ZEyTGZL9EvPCrPAG5SFs4XZcuH7g0
	u+n/sXjZBdq4csun8jOrqAAxMBIvl/NIy00qxTxvJYM0LJNCsePFaK9bE3OufrYIQHnAJoa+h6w
	DvULW8mf93ucoAc8N6ey+RCt79ueKiBjrgtbILORLmydLkcvfFTug2FxIQhZm/afRBBZEoDR9X+
	bd7xEQSLlsu2bF/qSi0897YSrc1kRKEYrZPp/dkc3GgpriHeljdp1XAUqMItDKIk0VHyUuFqCKO
	fHtddZB0YjU
X-Gm-Gg: AYBFou35OqdL1vCOukA993hzh2ycywSTqvYh7xWqDk+uvUaa/sIuh1V/SMONQ3QnUGa
	TMGWHL2oaKPpnu7juuEE1Zs0u/R0vopdEGMSTk3KzCWY5oo+0mrfSAOXFAtfdwl6K4j73vyMWdn
	Y9mTpVjGNledfHZcQ6yhb9bWXIiM3nHBdgK9qui1DDXAK0fK8EJ+gneyRXccGbpDSB8irs365R0
	yapBLPJ55AbBH4eo+5IdMmzGMruB0IOBLWxXISDE+MR1+UhsIt1gjLWKid0xEFtrkMNZPusXUQ5
	JzQvXgtrDqboHxJHgRK9vpYSMbyBtpmIVA4koan/nVI/5aHPFkiA1l5usFlFGPqFgMrnkS39K04
	aXZUXnhqqwQ7F/PFe+Ew4G52AyUD+dklp3iszdjHsazYDVRIKGOKLpoTXB+WCuOxDneacfH/aOz
	bj5K/+KJiBYHCbqN9LIM25dq6k+PF+ZHuKVAE=
X-Received: by 2002:a05:690e:4554:20b0:66f:deac:42e0 with SMTP id 956f58d0204a3-66fdeac4b72mr3150289d50.14.1788890862992;
        Tue, 08 Sep 2026 11:07:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91040555cf4sm1349986d6.0.2026.09.08.11.07.42
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:07:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66faff68c0bso604860d50.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788890862; x=1789495662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rb9I7ysehn3T8EdRE3wvUpvmDJ0lCancFwS1A6o0B9Y=;
        b=LPhhRCyRZyuzTQcBAmo2drGqrP28HOzZNxyvGkLAtbfADh+IdFghaBVWH9WHuyXWI1
         MesUe/3riC8kgFxmKyEKViA837nnijXTOe181u6gaKfb/8It25zsWu6u6rH+U82FmI/V
         15bDhw/q9LrVwyPKymxR1qlByGuS3WS9Q+cuk=
X-Forwarded-Encrypted: i=1; AKwUvBzz7t0fhot6egmswGZOoVVPjrE+N0zz8dUGohyJEOKbO1KabBc917n/96wG7xEpokv2WpiodEDX1Hs=@vger.kernel.org
X-Received: by 2002:a05:690e:1b44:b0:66f:9e32:fe1 with SMTP id 956f58d0204a3-66fb5921a72mr6969454d50.10.1788890861940;
        Tue, 08 Sep 2026 11:07:41 -0700 (PDT)
X-Received: by 2002:a05:690e:1b44:b0:66f:9e32:fe1 with SMTP id 956f58d0204a3-66fb5921a72mr6969419d50.10.1788890861415;
        Tue, 08 Sep 2026 11:07:41 -0700 (PDT)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm27114866d6.20.2026.09.08.11.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:07:38 -0700 (PDT)
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
Subject: [PATCH v1 4/4] x86/vmware: Run panic diagnostics before kdump by default
Date: Tue,  8 Sep 2026 14:07:16 -0400
Message-ID: <7487011dfb95aadda9515b22a5852680df1982c5.1788414671.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788414671.git.zack.rusin@broadcom.com>
References: <cover.1788414671.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The core panic path enters a loaded crash kernel before running kmsg
dumpers, so the VMware logger cannot preserve the panic in the host log.
Set crash_kexec_post_notifiers during VMware platform setup. setup_arch()
runs before ordinary core parameters are parsed, so an explicit
crash_kexec_post_notifiers=0 still overrides this default. The 0644
parameter also remains writable at runtime.

VMware exposes no capability bit for this behavior, so the default changes
for every VMware guest. Running the logger first adds work to the panic
path and can reduce kdump reliability.

A full log transfer uses 1027 low-bandwidth hypercalls; three checkpoint
attempts are bounded at 3077. In vmcall tests, a maximum-size transfer
took at most 7.47 ms; three complete transfers comprising 3081 calls took
at most 21.58 ms.

The crash report remains suppressed while a crash kernel is loaded because
the host may terminate the VM inside that call. A future report from the
crash kernel or kdump userspace can restore the event after saving the
vmcore.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/kernel/cpu/vmware.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index c21fc835537f..d88c625d8389 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -646,6 +646,7 @@ static void __init vmware_platform_setup(void)
 {
 	u32 eax, ebx, ecx;
 	u64 lpj, tsc_khz;
+	crash_kexec_post_notifiers = true;
 
 	eax = vmware_hypercall3(VMWARE_CMD_GETHZ, UINT_MAX, &ebx, &ecx);
 
-- 
2.53.0

