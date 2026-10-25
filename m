Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950022;
	b=ss54i3VyJ7B7Oe/7+EvcKWKAYH8yonb4BOW1DMG750b0l/Ow7JUeiLk5Eq8+DESOM4zw
	 0K9RQk2775Z5qyQB9GjoKCgAMBrkPmBbeU513FS4k7auVnLd2UhPQjEJzXOd+qZzx9KF0
	 HsN7l6dQOdUabv3aospB4MwHdtevaDvvf+9Fq3Nrp0/A52PiLpOf9OOOUyhMIyXbVuY1n
	 CG0vHSRUSN8i8HQ7umHDEap3uF4k7QLzUZqKsfkQbX56JdPjr61agx8Zc49mEO2EMubAT
	 lvz2h5ywOqBav2KfuAGketyovZNnl77/xcJx1RaR1FtjnGo9X0XXrhI2prvQvyxTEtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nlyb5eFqjPdmH1nFRtnItgVGTITVkyurMpQB27D3UKE=;
	b=TgvJLlJWRyMnyZyaiO56k7w+JV4VL51y5sxGJDtnDo7G2xCAg6u7MFWIqBA1wyVcqdE+
	 MZdsXo7Hi/E06FnZ0NGH38yo1yag9zTy7t+YnwVPXLDrfkOahKdOfuSb7xajnezG//QmS
	 /NEN/hkC1X7aBWOoyy29pcJcx9RzCxOjoFOq0oupBpipVbUn/OstNbKBQSB2JUXipjl4w
	 +C6CCSk8etQQMVq5AwABLnAasKqFAvza53wzxMhMJ3yGz/9yVWSaArty90f+ltNkTd62/
	 v8p6l9eJbJWe/GdEXiPMT17krbaC+81DAtRdl8htMHpD5mQ+Z1zKmuh+hxvxUJFePNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="RRZfVnC/";
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2A6606A320
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB2A6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=RRZfVnC/
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ead4026fe6so912887e0c.2
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 10:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950021; x=1793554821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nlyb5eFqjPdmH1nFRtnItgVGTITVkyurMpQB27D3UKE=;
        b=RRZfVnC/dOvs/C75LPnksTwnhs1L79kgUQgaAr57uMxwY7VzS7dWc9QA7n2vpwPSZf
         qYPuTqMOxANWNn7drKpJ7lFq0Zb3vyzGg6rj0/5ldJBNrY6t/58yh9hEX8kbnCaeQG6U
         WbQlratJqulqCeQ7xZX31XVOraunI37u7ERmn8KCIV7KfJ8rtFc1RqgIFFSehagCpjdW
         J/+DEt3OtgTsZuc82RNXaZQZW3XcAZR9HTqG6fAMt5m7ErXtTAV6QXXepzmf02qKfO2x
         QYaImDL/NmNRm9hlWAusGneQy6OSYvnfKgecdww3vdnONdLcdP6rd228Uh5342bUKqzG
         9Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950021; x=1793554821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nlyb5eFqjPdmH1nFRtnItgVGTITVkyurMpQB27D3UKE=;
        b=pcTzzrLvdcM6KjgjsNuxLiNhhTIcXT/M7rESOtBnE9NLha57UcT/1/Ajed+XrXy+Pe
         v54z4zCt4npPq5DXXHWoZBpvBlQZ8pJEexyDmQlyYVLHZiGgFVPMrNX0GLEoC0+5tMtu
         QnPHe5UEgw0cDBmr6jLzSD45ZZsc7MPgr5szFaPvDN6pom8p+kV3gEj6euz6mjNAwtpn
         Yahyp/FxdM2/EF3ZmmQ1neuihSI3+7+y1v+NpSCiJczoLj5dYsXVj34B70HruKYjasjk
         M3cyRFyBGwaKWiGz0kzVq6DuRe1dbx0RuSlkcUj3ZWUinKNvfwcP4ewP+s2ceJGcz8Hv
         HvKg==
X-Forwarded-Encrypted: i=1; AKwUvBytNuTil8rcMvabBzikNkcbVGxVjf9t56C1uqicYACAQDC51aukY2lFqqgtmcV9XvZKhBoeIn476jY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQg9328Q7SRwwWxnwJLk2fPLv6RvVBRcQgavCWoWmgPP1Yppvq
	oxLtnzivOXYa0lON93HztGgSoirpfKLfFwf5JXLACxGCPoE1vVOPB584a12yPXZ0QMc=
X-Gm-Gg: AYBFou3Y48qmIcj/ZQolUDHvywvXYH2LmWMmkZlbf1p76N7STxqxznrbWgejDV6ugO4
	29n2D1jizzChgta/i1KO4WFzGOXxFVKUAq/fUPrpciqOjiib3qTNVxRmzDJkDG2gSnM14m53dRN
	Ku6J562uf50MKiJrw1BDyvok2ZmBPIgi77yKd79R27a5WZPZbYdkguUeTc3Y0fzXD5gG3GxFuS4
	93AiAowtc4qkin1VtkFdLI2lPefYotHdaPk0Q2x4+pvrb8+CFQngnXQgpnZPglu28lMRuAa4gfw
	5P9eLGz0oywHoXZqmzcxJYlZlEopQleOhiDj5BdRm6FpUYx0R440v6A97IUzVRBS+pgEG38cO8J
	MJV0VJYhXTs18H2a2eVyEmeNMpl8F1v8YRtrT91bOtAaEYaJOlmUgpaSQ34dsin0ZTnTT32tBE3
	fDv/ELdcaZRp/7BDE1mD1zJObdHEE/Ap7kq7w6O0USsAYG0MwVhGSUtJGWiDPhrYcE4jejKAB6H
	TgLvJpWV8h3IAF2fbGiHZWFOM/uZeDjmyuNdLRkJLX0Nfcpj/q3Nz+JLalgvQD4xn2bfniFAMUZ
	3SlTLps6bIpQkqFrV6sfod5ZYpnrr3xNVdSiNXZSN31xlSO35wqAu3qa7vo1SWQhsr+eCTRPKzC
	D
X-Received: by 2002:a05:6122:1829:b0:5ea:d649:d1bc with SMTP id 71dfb90a1353d-5ec232b5465mr1591325e0c.18.1792950021033;
        Sun, 25 Oct 2026 10:40:21 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:20 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v2 1/9] kho: expose physical address of outgoing FDT
Date: Sun, 25 Oct 2026 13:40:08 -0400
Message-ID: <20261025174017.3870481-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the physical address of the outgoing KHO FDT via
/sys/kernel/debug/kho/out/fdt_phys (analogous to bootmem_phys) so
that userspace tooling can locate the root KHO FDT in physical memory.

Also add kho_debugfs_cleanup() and remove the KHO debugfs directory
if kho_init() fails after initializing debugfs, ensuring fdt_phys
does not retain a dangling pointer to a freed FDT.

This is going to be used by the upcoming KHO read-only mode.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/admin-guide/mm/kho.rst        |  3 +++
 kernel/liveupdate/kexec_handover.c          | 10 ++++++----
 kernel/liveupdate/kexec_handover_debugfs.c  | 22 ++++++++++++++++++++-
 kernel/liveupdate/kexec_handover_internal.h |  7 +++++--
 4 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 902d171a780a..2ba884c620c5 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -96,6 +96,9 @@ stabilized.
     current KHO state in this file. Kexec user space tooling can use this
     as input file for the KHO payload image.
 
+``/sys/kernel/debug/kho/out/fdt_phys``
+    Physical address of the outgoing KHO FDT blob.
+
 ``/sys/kernel/debug/kho/out/bootmem_len``
     Lengths of KHO bootmem regions, which are physically contiguous
     memory regions that will always stay available for future kexec
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 6f1f55fe3181..ce5983abf181 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1851,17 +1851,17 @@ static __init int kho_init(void)
 	if (err)
 		goto err_free_fdt;
 
-	err = kho_out_debugfs_init(&kho_out.dbg);
+	err = kho_out_debugfs_init(&kho_out.dbg, kho_out.fdt);
 	if (err)
-		goto err_free_fdt;
+		goto err_cleanup_debugfs;
 
 	err = kho_out_fdt_setup();
 	if (err)
-		goto err_free_fdt;
+		goto err_cleanup_debugfs;
 
 	err = kho_kexec_metadata_init(fdt);
 	if (err)
-		goto err_free_fdt;
+		goto err_cleanup_debugfs;
 
 	if (fdt) {
 		kho_in_debugfs_init(&kho_in.dbg, fdt);
@@ -1893,6 +1893,8 @@ static __init int kho_init(void)
 
 	return 0;
 
+err_cleanup_debugfs:
+	kho_debugfs_cleanup();
 err_free_fdt:
 	kho_unpreserve_free(kho_out.fdt);
 err_free_kho_radix_tree:
diff --git a/kernel/liveupdate/kexec_handover_debugfs.c b/kernel/liveupdate/kexec_handover_debugfs.c
index 7d74477da0b7..db3830829398 100644
--- a/kernel/liveupdate/kexec_handover_debugfs.c
+++ b/kernel/liveupdate/kexec_handover_debugfs.c
@@ -95,6 +95,15 @@ static int bootmem_len_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(bootmem_len);
 
+static int fdt_phys_show(struct seq_file *m, void *v)
+{
+	void *fdt = m->private;
+
+	seq_printf(m, "0x%llx\n", (unsigned long long)virt_to_phys(fdt));
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(fdt_phys);
+
 __init void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 {
 	struct dentry *dir, *sub_fdt_dir;
@@ -172,7 +181,7 @@ __init void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 	}
 }
 
-__init int kho_out_debugfs_init(struct kho_debugfs *dbg)
+__init int kho_out_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 {
 	struct dentry *dir, *f, *sub_fdt_dir;
 
@@ -196,6 +205,11 @@ __init int kho_out_debugfs_init(struct kho_debugfs *dbg)
 	if (IS_ERR(f))
 		goto err_rmdir;
 
+	f = debugfs_create_file("fdt_phys", 0400, dir, (void *)fdt,
+				&fdt_phys_fops);
+	if (IS_ERR(f))
+		goto err_rmdir;
+
 	dbg->dir = dir;
 	dbg->sub_fdt_dir = sub_fdt_dir;
 	return 0;
@@ -212,3 +226,9 @@ __init int kho_debugfs_init(void)
 		return -ENOENT;
 	return 0;
 }
+
+__init void kho_debugfs_cleanup(void)
+{
+	debugfs_remove_recursive(debugfs_root);
+	debugfs_root = NULL;
+}
diff --git a/kernel/liveupdate/kexec_handover_internal.h b/kernel/liveupdate/kexec_handover_internal.h
index e9685e1ef6d7..38181076f603 100644
--- a/kernel/liveupdate/kexec_handover_internal.h
+++ b/kernel/liveupdate/kexec_handover_internal.h
@@ -24,16 +24,19 @@ extern unsigned int kho_bootmem_cnt;
 
 #ifdef CONFIG_KEXEC_HANDOVER_DEBUGFS
 int kho_debugfs_init(void);
+void kho_debugfs_cleanup(void);
 void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt);
-int kho_out_debugfs_init(struct kho_debugfs *dbg);
+int kho_out_debugfs_init(struct kho_debugfs *dbg, const void *fdt);
 int kho_debugfs_blob_add(struct kho_debugfs *dbg, const char *name,
 			 const void *blob, size_t size, bool root);
 void kho_debugfs_blob_remove(struct kho_debugfs *dbg, void *blob);
 #else
 static inline int kho_debugfs_init(void) { return 0; }
+static inline void kho_debugfs_cleanup(void) { }
 static inline void kho_in_debugfs_init(struct kho_debugfs *dbg,
 				       const void *fdt) { }
-static inline int kho_out_debugfs_init(struct kho_debugfs *dbg) { return 0; }
+static inline int kho_out_debugfs_init(struct kho_debugfs *dbg,
+				       const void *fdt) { return 0; }
 static inline int kho_debugfs_blob_add(struct kho_debugfs *dbg,
 				       const char *name, const void *blob,
 				       size_t size, bool root) { return 0; }
-- 
2.56.0.307.g5fe7bd680c-goog

