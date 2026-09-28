Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5F24EB867
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618181; cv=none; b=pm2UDD2T3gzGboJZDyfjjmCbr8NWCqtl28IVfDkcpjwxYIh+MDuAbGFowzs4wxns72Sod7S3com1qwgh6M/XB8VoJeCPz8nBaj4UOKNAizyEKE9wt5Io30+1qdalmkXhTzMVvz07zP550WCvWF+cpUKLwSGoUu16aUBnfg4FYio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618181; c=relaxed/simple;
	bh=JxvuznqLzoNHOFITq+5sVj04mlf4U2b0YpG5PaxY7SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlHjxprVAi8a0cGi4n53YWkAyTiKC6lAG+EZnNOd2e5OVJEqiBCEkB1UzlwVBR37Ks+2+6EEHR3LOyY9Al1sw6y1OD6PbZRPXzkxsWgEyFB4Jj9FqQb4VWTyFRW5V4n7dP23kZTZBJN3yw/J0D00LqOn1BV+GNr0Cc3NXKQd7Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Nop+348M; arc=none smtp.client-ip=209.85.210.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Nop+348M"
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-8121458be2dso97808a34.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618179; x=1791222979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+oiZYN5anlVv9s+aMa0ZbcmkVGe0RnDqM3OKTw5q4I=;
        b=LW4loVIR9FEZuFS/wj98B1f+lB9CgIqxN/HXBx0ZvIgFsKoI3F5waT3gMm868aO9k1
         QUZ+kwaly+h1Ej7xs06Jyn6ORzUopIIkSHXwrBpCKL3F7lVg5C+8WxFMNOBHlgQoSGvC
         VsnfgeFldq2PIDJvoWAnNsVn6cTVzDZzAaZuxMGf/9PKpdeA0FzQzP5U2NDqq+00vjRS
         sxdUQBKgB8Ul4qGeJKmyQRhACwwy6WVD3RRUVv9imd2gkCSolrDSQHy8URBoTOd9rsK5
         VlEA85TDDCtKkvMFIG5KWFGHERw+VZNvUFjnQdCVMVKWgpZfO1p+MSeVVPob+v6IQOvd
         BS8A==
X-Forwarded-Encrypted: i=1; AKwUvBzXL7vL6HG3o3QskxCJqOEy3pEy/SGBkFRSSPOPYiYR7MgTwbYO7tE2+3aPbQNGCCPLY/K2WFKp9ME=@vger.kernel.org
X-Gm-Message-State: AFuF++keOG5DQFHor0LmHsfbzsxpByq1JQmOog03kXmZ0owqET8raGM6
	wBtVXUJzUuglYKT7nToLZEPLXL/uoy6b3DtW5LtsEtjPJ/WgP7KkAypcAYgsDt8KBx/pv1M86IS
	Q6Qby0i+etAuSwIRid7YQLJi6jwqmeSMj4DlfL7l+4skhaJeF/nrOAVDdLhJUcrkhlUFskzZHjO
	pyuP1QHlMfwRUs3xvwRmrH5uRs7Y9owIue0puABNAP387758Ltl/sk+JEaUg1NmRAaBoWmPxfVc
	FdOsvUxoA7k
X-Gm-Gg: AYBFou0McpPl2ZgK/RzrQvOSYlSRJ2h6H2arU3IG4bT404k4U3cL6t5z27vP9aOVqLy
	M9tb1wuD2uGbRptd2sQ8jwhw5BK8uURoJUNCs1AttGnmh50sXoNFyaCb1nbqAofGk8cgspexemx
	CK3RzcOyEvqRgAf0V0v0YgG8gaXFqjG+AZxkKb+1wdDEt6r5IBfwn80iCBLNjbqeofifZolJtWJ
	UFsHz0AFOAEo3DKcOTeCFErZLibfBs/taKQp3grr/7xYr/vbheeYeQ56dVDBmOrbxG5qMFyy0ls
	t9r4qeCpZo7Fc3SDVjGEaMSKHHSiGFn1H4q/aTCQ560qQJ5cdR7f69GXQhKlxlYuibgYmj6up9Q
	NVFKNUEt7K4eOe3VtJkrkRpiY0Bduj0DflYpGL855RkoMjAZHgawllnf5z0rJs9AuBknpcjZsM7
	JAIdltQUZ2zv4XyGb9jIe/C8Qo6D5Bh5wn
X-Received: by 2002:a05:6830:6ec1:b0:81b:a257:70fb with SMTP id 46e09a7af769-81e75239a76mr43753a34.7.1790618178721;
        Mon, 28 Sep 2026 10:56:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-81d59015308sm666715a34.10.2026.09.28.10.56.18
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:56:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3282d5302ffso157673eec.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790618177; x=1791222977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+oiZYN5anlVv9s+aMa0ZbcmkVGe0RnDqM3OKTw5q4I=;
        b=Nop+348MUt4IpyY+kIQvSt4XZq85xIr1HwJ66IjENZI7lOHiz5laaFqg9RYNabPB+g
         dOvmvM6osEpK2c0153TeRNBFof2x31StiLCTjP8tr5WRNPG5rfbm7h0ZYKvXHQXg9LY7
         tV52FkF0z1JliXIceqqKP9FKfGeYln8OIpW8g=
X-Forwarded-Encrypted: i=1; AKwUvBw369va4Dy12EIIXa22Oc7MTyotqqcg6fxJqTepuyi1aiczbUpgz7EE/QVEKqbVHyLCh2vgB/K5tXE=@vger.kernel.org
X-Received: by 2002:a05:7022:d42:b0:148:ece:8cc3 with SMTP id a92af1059eb24-14b2ea0652fmr138513c88.24.1790618177009;
        Mon, 28 Sep 2026 10:56:17 -0700 (PDT)
X-Received: by 2002:a05:7022:d42:b0:148:ece:8cc3 with SMTP id a92af1059eb24-14b2ea0652fmr138487c88.24.1790618176363;
        Mon, 28 Sep 2026 10:56:16 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm26076069eec.10.2026.09.28.10.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:56:10 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 2/6] crash: Notify pre-kdump callbacks before switching kernels
Date: Mon, 28 Sep 2026 13:55:36 -0400
Message-ID: <9ef573cdbbf5e659eea16fa23afeaf2488049198.1790014793.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790014793.git.zack.rusin@broadcom.com>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Fatal x86 oopses can call crash_kexec() without reaching panic(). Run the
pre-kdump chain from __crash_kexec() as well, after finding a loaded image
under the kexec lock and capturing the original registers.

This covers direct crash entry without moving all panic notifiers ahead
of kdump. A missing image or failed trylock leaves callbacks uncalled;
the shared guard skips callbacks already invoked by panic().

Link: https://lore.kernel.org/r/aquttpMVKX8e6zGB@pathway.suse.cz
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
New in v2: cover direct crash-kexec entry in a separate core patch.

 kernel/crash_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 2b36aa9fade0..5d9fe9e00f39 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -23,6 +23,7 @@
 #include <linux/objtool.h>
 #include <linux/delay.h>
 #include <linux/panic.h>
+#include <linux/panic_notifier.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -139,6 +140,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
 			struct pt_regs fixed_regs;
 
 			crash_setup_regs(&fixed_regs, regs);
+			panic_notify_pre_kdump(NULL);
 			crash_save_vmcoreinfo();
 			machine_crash_shutdown(&fixed_regs);
 			crash_cma_clear_pending_dma();
