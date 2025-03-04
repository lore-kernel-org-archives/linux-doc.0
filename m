Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AE220127F
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089623; cv=none; b=PvxRnskfs3CrQ8RkvT2ei2CjDllhSbjjL9LwSMeVxgqrBL0FVQqdyJJT7F3StZetrpslPwV5cYXDmL4beLjKoUseP5vem1RnevdvjgtZ1DsrTO/qG2CZf1AUgRQH18s2U7o0SvWmUGEp2pUpRRh9ozPRSL7ZvKLdqCJUIOe6AVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089623; c=relaxed/simple;
	bh=o9zHYBZOjWU+lYENxdkNUmWAHWMdM0ccAzzowc3/Wqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R2OrW+M+OuZ7RGcre2VUhxdUKhLEe1UIyLDg3mvNdjFOiHoZpze+A9e8eCcuVxx7yu9KhHkauWz/WYpQspPpVM+rp1wJ9fnsD/LYO8DpaslgINZ8TXkMQlox7FAF0FYdd72qKOZvPR2vRTEQ/ZuOFnOTHHKOeOFaHOIiBbPDVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=malMFTyy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="malMFTyy"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390eebcc331so2304249f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 04:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089620; x=1741694420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BL25umXnpXBBzwUoMnOj2fRLliDIrDaDucRmmKK49J0=;
        b=malMFTyyntcxxuOqIPiwXc4Vb6eE5/bdi71u7dZ1a/N1arijWciJP3fRpZGC3gkzPO
         U7X7UjjIUNR9eSt3ZQvRhV2reH1cAnfjntcFR9gG+mEEzsjMeFS+XMaYVEpcz7DLno6b
         iJvpJDprrGQz7hCRuOpX4ACOEuW90GrYGD+RfdRC0Ep/wYRlYjVLpRBKm9cggsQbxJ5/
         F9FQIKDMLyTbGh3WD/8eAC85sK0lJG8CGVs+PF3cIhS9ePR7u78N+eaQ6REmRrcvQG+4
         JWpLZa0VAtlOF6wMuBCoAq9aN5EANkFb1AD3QpZP+2hE56mRvWkK4RIELnP+Rf4XOvNA
         tBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089620; x=1741694420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BL25umXnpXBBzwUoMnOj2fRLliDIrDaDucRmmKK49J0=;
        b=aMp+HxIT868MSIMkTVNi8lD7HUAV6kduj73Lg2u5VShCGurvWPmsai+xJIJskqDUPH
         iyem2HJ/PKizKC5vT/12tEFPjykWElwui5VcqlkE8eBSIGw8URQtPxwyrGTj6psg6JQh
         YxTccdIyXxc5gCIV6pZM/7WDphxveIcR84LWavVU94LyUny9kWrihXd82ohiQ3+n4os+
         ud9tjO654t6WOKUJjI/aShRkde++PL3eZco+XsITkbLquDzPfaBBMVi9oeKkU8NlBMK8
         xwMe5cYoiQXhTxKWCkDN3iPbJkaT2eQG6UHAV2MBnDuPkxVE90FmPk5eUJVJC/NpV28M
         PxXw==
X-Forwarded-Encrypted: i=1; AJvYcCXsY3dZ3tqGPR4vWWat1rAH+ZAxVAM6bPBDBfSyIWlLO8Mm3TFZtCjsqu01MvWr0sWjuptUFyoYZ3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqKScO6kismshIfKw8z8qcrvpBKbpqHu9l9SN5FkeCRGurX98y
	ti/vUnsAjks4pI2ueeglWdg/W+FskGV2jtJ1A29oDiVj7acHdVAX8TP1B+oyC0g=
X-Gm-Gg: ASbGnctdIIozwWzpjNQHioShlyzjdj/JIPGLzGg+vUaofZ4WioFcqa2weYBR1FvanWT
	WRuQX15bJDTpKaLdh7RSjuyjcWcx9f1XeaK51FW7oIlNsVZUkZBSOwf5dQ4UdDQ70uMSCL8Dzcu
	F62LFkjNA2BuCEIHWZ2TSrBFW/nem/UPQFI1Vg2Df5L2EUDIx+67/Fbkh7SfpVUEcv6/PihVgNQ
	o+P7lmv8msyr/TGIJcPBTHZ3Ljm27m2lw3V54TIx2Sy4wQi2dMQA1XsgEAHX9CAjpJHmzVb6dSu
	fKqlYY04G8kDaQkLHU8y0azbEzyAuEd2
X-Google-Smtp-Source: AGHT+IHGl4juoP1IGvAETEutihGGilncidBGnRXIsTr2+3oea3NO/pXu/tqvOIeNlFeGq7iMlTLrtA==
X-Received: by 2002:a5d:64e8:0:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-391154af01cmr2483532f8f.0.1741089619498;
        Tue, 04 Mar 2025 04:00:19 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bcbdf7a9esm21728565e9.13.2025.03.04.04.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:19 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 3/8] riscv: Fix check_unaligned_access_all_cpus
Date: Tue,  4 Mar 2025 13:00:18 +0100
Message-ID: <20250304120014.143628-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_vector_unaligned_access_emulated_all_cpus(), like its name
suggests, will return true when all cpus emulate unaligned vector
accesses. If the function returned false it may have been because
vector isn't supported at all (!has_vector()) or because at least
one cpu doesn't emulate unaligned vector accesses. Since false may
be returned for two cases, checking for it isn't sufficient when
attempting to determine if we should proceed with the vector speed
check. Move the !has_vector() functionality to
check_unaligned_access_all_cpus() in order for
check_vector_unaligned_access_emulated_all_cpus() to return false
for a single case.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c       |  6 ------
 arch/riscv/kernel/unaligned_access_speed.c | 11 +++++++----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index aacbd9d7196e..4354c87c0376 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -609,12 +609,6 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
-	if (!has_vector()) {
-		for_each_online_cpu(cpu)
-			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
-		return false;
-	}
-
 	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
 
 	for_each_online_cpu(cpu)
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 161964cf2abc..02b485dc4bc4 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -403,13 +403,16 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 
 static int __init check_unaligned_access_all_cpus(void)
 {
-	bool all_cpus_emulated, all_cpus_vec_unsupported;
+	bool all_cpus_emulated;
+	int cpu;
 
 	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
-	all_cpus_vec_unsupported = check_vector_unaligned_access_emulated_all_cpus();
 
-	if (!all_cpus_vec_unsupported &&
-	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
+	if (!has_vector()) {
+		for_each_online_cpu(cpu)
+			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
+		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
 		kthread_run(vec_check_unaligned_access_speed_all_cpus,
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
 	}
-- 
2.48.1

