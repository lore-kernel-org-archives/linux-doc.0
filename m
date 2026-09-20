Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9774756BB
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933089; cv=none; b=e6cp9duwhDTVj38C+kyr1VHzMhb3sLdiNWcL9lgI0d6v4BXCmbJg03IsJ0VviVhmupeqjWtbpYjeIbPKI4FlbXMiqUelAJ0nFawm8ugttW/Q1LtzeQ2LPkzt9lwikIgFIzDkTRRPCA+EMXUTaUkwlM5gOYn9Vl4sRqzh0mLbIU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933089; c=relaxed/simple;
	bh=vD3k0UChVcsUPV8WCpzl60xjcOJJ7AH4O6Kwg/ASCvo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mao8YbMXa//ueoplO6UohbRN4j0ZXgKQmnRFshbdUZbKn5ZTlPcPSj9LOEfAMjzvzMhKFSKrFzAx4l3LnV3G7LZ1EACBrkW+tgY+hC+X6s7oGTu+L/ej3vfssZnc7Acj0o8TzrurMlRcu6xsaXWz28rIWjZbIfroMDq3sxpdsFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=RrlNGgY0; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="RrlNGgY0"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-895fd505832so15689717b3.3
        for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 12:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933086; x=1790537886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xd0t5fQ0wbqovFneONezXRLopfuFSVDwWIsqSLQ6+6E=;
        b=RrlNGgY0iJCLHvLzaOqKkf3gLzRqZRNs3AAepRwIwDleyCYaiOghA4vqiXA6qubzC+
         24dvZefH6rJFbESqgiBexlht9k2P4jayHUVOxKavkv047Iwi3j68ZxrHzNYxx4AhE2Qb
         aKxGtjXjJX6+0Sgcy+nXo4muIMtbk+5iXSH83LreZrlNlj5brul3XvqxZuXYyMkJHbx2
         M9kE4SgGfjg/AgZJ+kZyRU2gcJRKIyvpm8ZE27VVSIw/faLLB90ylpqTLqx8w3sMAtH5
         fDGymuvYj2dE2L3f3IPD7SWIbaWLjxdGzXi9W7OVFRvoL20by8hHYOwrYpq+32pX2pRJ
         NpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933086; x=1790537886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xd0t5fQ0wbqovFneONezXRLopfuFSVDwWIsqSLQ6+6E=;
        b=BhDjmrWWxtxOSFbeCawz8T2MKKBEKbtosySsG72+BorktU5tHfTWNO2XtG1/Ka6fh0
         C5uQprAnIF2Vc3SmxISGDnNBssfqngiYvOZpYyNVbv8OvC/814Y+MWmnDGinFtciH+79
         n7Yck3SfGdCjPgBqwXr9DmnME6bRoxkS6YSzam2st2lBcnliACJVWAOhv4qg0RMmmvK3
         LT8m1koBtZjy6R7ddMwo/X1P81P0iuLi8uJEHUYFo/gg2PYM1acT6X6Q28lxTg/dwWMC
         5dRL6r6SXIByH7cQ6q+TwdxgOryD1Yv8RrR03WVhw7YwEzT8Eduj2C6JiO/b1Vfatbis
         yuPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxs+KZJO+2USvnW1h6kw4ASZR0+kVnQ5gED1mx3mD29bfQksJj2rePeQygyA7uFrY5A/yu56bsTsxs=@vger.kernel.org
X-Gm-Message-State: AFuF++kvh4wk6Lf+L5b4d/EbVeRZhLsEMdPQ8TCcpp6uDqbQwpVgaeFb
	gDMgzKrjelB75w7b2rASyV7VMYp0szd2xnLIk/FRR5qrDSvAQ1N3YJCmzk4wztr04E8=
X-Gm-Gg: AYBFou1nV2O/NWgGyUYovNMD5Kg2k0IjTcygU17XCKyC7+u0dNtC+TgwgMZYwiNScr3
	FrwsXTwSu67v2EI0pzUTsFEMLZpaVR8ftJBrbJIxQ3Wus7VFQu4YbsHv9HEOrk6e+alBfVFT7FR
	I9oZ0NSC/0VSxGFXUrqxPhCA0b8jV3p8rkgAOyaKHMBRTR8uo294PRzUtXxP/W5gOyxPfzaFF5c
	L1bW/aM1OeCvFqmHDDqceOBr7cyWOCdPFMcefXlMXuQV7Myu6khA+VViKJFUgrmKHcPohTxSe6T
	PVZoALhotir6t0B7xJhBwMgGBFzsHzwtNP3qqwlvQrmObUzo8yBDuhEVVOEHJ/gednKk4fUupWg
	evxlpVDbkeKn5Bg3EhvKSCMjGNWvHakM0dJhhMwDZCXq3qtBRuW1crtNXBvjjmPb4DtagNAdfsf
	K5FvqkWmfvsyPIOYLO8WCCXZDkMlMuKLE1M6m214gdsjVf3QboFp6xlXbShqcYAFJNwSFgaxNaw
	DhilQmqnH833mrjmwUcy7WizNTT47+mU1XO9cgA8Q502AGNBp13IWSUeryBlm5R8FjLsYS/Zv7Y
	o2a37SwTLk4qLh9Mblk=
X-Received: by 2002:a05:690e:dce:b0:66f:c1be:a646 with SMTP id 956f58d0204a3-6717fd8f1ddmr2788927d50.56.1789933086522;
        Sun, 20 Sep 2026 12:38:06 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672991445desm2614214d50.20.2026.09.20.12.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:38:06 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	legion@kernel.org,
	kees@kernel.org,
	will@kernel.org,
	ruanjinjie@huawei.com,
	atomlin@atomlin.com,
	rppt@kernel.org,
	jani.nikula@intel.com,
	hamzamahfooz@linux.microsoft.com,
	joey.gouly@arm.com,
	tglx@kernel.org,
	nsc@kernel.org,
	alexandre.chartre@oracle.com,
	james.morse@arm.com,
	dianders@chromium.org,
	bp@alien8.de,
	jpoimboe@kernel.org,
	shuah@kernel.org,
	catalin.marinas@arm.com,
	linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvmarm@lists.linux.dev,
	jaredwhite@microsoft.com,
	johan@kernel.org,
	pbonzini@redhat.com,
	mingo@redhat.com,
	linux-mm@kvack.org,
	seanjc@google.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	tarunsahu@google.com,
	gshan@redhat.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	xur@google.com,
	djbw@kernel.org,
	oupton@kernel.org,
	nogikh@google.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	zengheng4@huawei.com,
	peterz@infradead.org,
	corbet@lwn.net,
	suzuki.poulose@arm.com,
	luto@kernel.org,
	hpa@zytor.com,
	zhangpengjie2@huawei.com,
	x86@kernel.org,
	yuzenghui@huawei.com,
	jic23@kernel.org,
	ardb@kernel.org,
	pasha.tatashin@soleen.com,
	petr.pavlu@suse.com,
	ryan.roberts@arm.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rdunlap@infradead.org,
	kvm@vger.kernel.org,
	fuad.tabba@linux.dev,
	maz@kernel.org,
	mbenes@suse.cz,
	jgross@suse.com,
	seiden@linux.ibm.com,
	pierre.gondois@arm.com,
	song@kernel.org,
	nathan@kernel.org,
	pmladek@suse.com,
	graf@amazon.com,
	chao.gao@intel.com,
	zhenglifeng1@huawei.com,
	arnd@arndb.de,
	sidnayyar@google.com,
	linux-arm-kernel@lists.infradead.org,
	vladimir.murzin@arm.com,
	kas@kernel.org
Subject: [RFC PATCH 12/46] liveupdate: Add liveupdate_session_name() helper
Date: Sun, 20 Sep 2026 15:36:16 -0400
Message-ID: <20260920193650.3373435-13-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
References: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide an accessor function liveupdate_session_name() to retrieve the
name of a live update session from its session handle.

This allows kernel subsystems like CPU preservation to identify the
session managing preserved resources.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/liveupdate.h      |  6 ++++++
 kernel/liveupdate/luo_session.c | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 6051abc0612c..119ad0f82705 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -256,6 +256,7 @@ int liveupdate_get_file_incoming(struct liveupdate_session *s, u64 token,
 /* Get a token for an outgoing file, or -ENOENT if file is not preserved */
 int liveupdate_get_token_outgoing(struct liveupdate_session *s,
 				  struct file *file, u64 *tokenp);
+const char *liveupdate_session_name(struct liveupdate_session *s);
 
 #else /* CONFIG_LIVEUPDATE */
 
@@ -321,5 +322,10 @@ static inline int liveupdate_get_token_outgoing(struct liveupdate_session *s,
 	return -EOPNOTSUPP;
 }
 
+static inline const char *liveupdate_session_name(struct liveupdate_session *s)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_LIVEUPDATE */
 #endif /* _LINUX_LIVEUPDATE_H */
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index f48e9a4185f9..3c4f195d375d 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -683,3 +683,17 @@ int luo_session_serialize(void)
 
 	return err;
 }
+
+/**
+ * liveupdate_session_name - Get the name of a liveupdate session
+ * @s: Live update session pointer.
+ *
+ * Return: Pointer to session name string.
+ */
+const char *liveupdate_session_name(struct liveupdate_session *s)
+{
+	struct luo_session *session = (struct luo_session *)s;
+
+	return session->name;
+}
+EXPORT_SYMBOL_GPL(liveupdate_session_name);
-- 
2.55.0.1082.g2b9226bbc0-goog

