Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640240;
	b=bdIqo7oJBgDOPQRkozlomA+RZjJZ5aso5HPmSdUN3uAIVhTK/WbdMl+DqAWWt3Nogqx3
	 9/mumgiS/ykiaR7p3Jr24g4N2xg81w9Px9Srd+3bZH3lzrjN/JfLJVffv6Ni6qK64Tm1u
	 1ul1VrZ6+QgU6EcrryRwFfGBPJZZxD2BX9WV/Hv6idzL4hnbHKsU6b5c9KIBYEkPFrzbt
	 QDtFmDTr70Xh55a8VoSioaIUwlis3tyMItj3UL4IlBGffH4CJDux9tSHnd1FVK7LFsBaa
	 PI91kZGKLPOjduT2aJezdlslspGrGXXSCFQDpyCZeI77VWFiFRrDTT7vqlJJFc44atg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TW0pg36vCDijleVRTyqZR6UjU0iehYYk3FdVNC+q6Cw=;
	b=X8gbB226eq06hi2dMV6507k7Fk2g0UN4nGI9/LPyI9FtiLyQRHUX1PEzbmtgOikXZTdi
	 42Voy0HM2zw+INxOUDAhRf15wL8KR34MkoaS+GBZO/SrmTxROMSYIAnBEnZ+owDwdmf2G
	 AK2t9lHQTnqf0FyjK2+aJn2IFreOAW7PcWT4My3uIW1jUB0+dUT73GcQErj7G1I0480oz
	 R/jhl387mlkf3zkqQTIuuCfhLn5+oaikSQVK7msNOAF6TmK97i5YqwONxS4zi2A/zW71c
	 KTM0+xSieDDQUD8w1xH7SBo2nEhu2dAbsg8FPw/QfEiEjfHRHW3ArE2AzYB59yCijIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Q3DA2nko;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C675C606A88B
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C675C606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Q3DA2nko
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91f332a4b2eso5815646d6.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640239; x=1795245039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TW0pg36vCDijleVRTyqZR6UjU0iehYYk3FdVNC+q6Cw=;
        b=Q3DA2nkof5TccLKEKOkpoD4tlAOwkqtDIAn0I7af3oHWDqV3MDanG1m+HE/Hze03RB
         qgl3c5vxWVmkXsR09wn3vLHdDsQxs6n5d5kmh2vSTwdxhuPGurTHI/rf19CMjpalpwLk
         Bat76O/tF4T0TriwTFkD4rF4Myqr5UPy8AlQL4K/O+nVeq1syIpOIfYk8TaDUdAHd5w3
         QDiVsq+WKJug4sgJGFgXNDsZz1FuysrzHgEgwFF25lm8FzKJWbtQrAoKggIMdZvxF0BJ
         30S+RNohN7c+/TVaM/HNeDtJjy04gi9aW1TsyxUlWnJ0PK27ITnaJvWinVawe5+Yuzex
         YAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640239; x=1795245039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TW0pg36vCDijleVRTyqZR6UjU0iehYYk3FdVNC+q6Cw=;
        b=ITr39yDv7WpLFIChw+BfOcY9MZd3M0gFx0P0mtYZg2d2dIgXNKNLgahxHP3BrQ2BdO
         jHCSmLezC1u19fg35OZa9UiMqAVWQpmTHaK1wuYMhZgrkrjoqJJzNqIFSo7VU8fSFxNX
         LM9K2SBRmHjEc7kgQj848E7xXjJYQHu/ih6qFEzlq/w9aAqDJ2YeUEK8sElsKcGUXlET
         p/tQis24HeQrZKSvMlUN4P5VqngB4CbCymAssdN+YHJ+uD0CSedPpgxXwbvcBBUHJJKQ
         JKNklPtD7BK3gg/52QH2Bokc5j3zpCLRmOaJ2MVkafxe2gW6ubCD5ItDQnHyfQHh8YP4
         BXAw==
X-Forwarded-Encrypted: i=1; AL+hErG2L9ZKIhmJfCCEFfhRAUnRJwTxaT/a4SCm3OV0tZeMzX7Zp2blY3pVFT6oofbuxPQTu/0X0TOmlOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SFJD/gDEf84lz1n/yiP96w/DwoN9MAtZK0T2tB2o79AvvQp68
	WqVO/Qrb+A+e5Aiang0/Fjdz6nKAhuCpWP+6mxxxKvddUNIQs/cDEIyXSVLrnrOh86A=
X-Gm-Gg: AYBFou1mMTb4YHti1sSTPSWqH890TQa5PCctqoAj7Ivo5U8vqhbbZcojXTM/WgDxopg
	kV/ZjMXO0Ud94lHeowYSPo+xzEi6epblESN16tLftxtYALq3P+90GSeZSZU4S2OnTKASNQIeVCt
	vDe8D0t9eMIpmOtvR2UQy3NHP1npeAP+8c/mij7SRnWpy6+V9Q13buXLqaBfxMRalaFWGUx2Adt
	jq+qisGggnGrk49qjlPC5D43ZBY0UxKOIh7DPyf9Cm4Lb+r3Ogsg7HRDFTE8l7FJOclDvuSFTfc
	BT91ljIntr19KBThpJ1alEhG9Xw7HTeNXysLD6P2AnSiu3aK6Dv3qQ+nXyIfT5hD/l2WbnaOMZs
	NH4cCqYSxWAHHrvloSjOLhJwMhqoaDJtIPs45lBK/BONSPJtSyMq+FQbGglGZboD3r6jyJnlL5v
	cT6R0lmhKzE8R8RbFb9UeC1guMcQmvJuKgGrOwvazJdNYTT/4toD2xwAmgRzfxvk/3JbyqHSc6y
	O47P5HKpdz0rDHrLG30bFiYh0obF8ywATfOlCEEZzhQQtwycDVL7jiUEsu2QICet9xe3E4+iWBO
	w+LjLnST44kYFRhLGBlntfEs4OFy8SqZKIgWjS5FuxvDUMA6gug/xjb/IG2tKN2oKpk5mQCxOLs
	aUYIA2E/55S3hMhqhv1H+1LazPXqnTG5bFaU8
X-Received: by 2002:a05:6214:1311:b0:91f:2208:b683 with SMTP id 6a1803df08f44-91f2428c6aemr76715686d6.55.1794640238785;
        Fri, 13 Nov 2026 23:10:38 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:38 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 16/22] tty/sysrq: use common memory for the manual OOM zonelist
Date: Sat, 14 Nov 2026 02:09:53 -0500
Message-ID: <20261114070959.3490008-17-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
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

SysRq-f constructs an OOM request with GFP_KERNEL and supplies a
zonelist for allocation-constraint checks. The request represents an
ordinary allocation, whose fallback domain contains common memory rather
than every node that happens to have memory.

Select the zonelist from the first common-memory node instead of the
first memory node. All memory nodes are common at this point, so
behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 drivers/tty/sysrq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index f4571d05b4962..824f5836b47d7 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -386,7 +386,8 @@ static void moom_callback(struct work_struct *ignored)
 {
 	const gfp_t gfp_mask = GFP_KERNEL;
 	struct oom_control oc = {
-		.zonelist = node_zonelist(first_memory_node, gfp_mask),
+		.zonelist = node_zonelist(first_node_state(N_MEMORY_COMMON),
+					  gfp_mask),
 		.nodemask = NULL,
 		.memcg = NULL,
 		.gfp_mask = gfp_mask,
-- 
2.53.1-Meta

