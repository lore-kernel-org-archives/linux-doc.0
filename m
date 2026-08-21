Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5FA337BAB
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338693; cv=none; b=EE3xJUMVoEoe1JKmQCE1PMUB7U69l4P4FwjJ3t/XVQdkB8vh18D84VgQhznukTteyk3OZX2GDYK5r3072F06G9in4D2bG+PDPwFky6Os9bhLCcC3y8J92jooakB1i72iBdq+nOMrt3e8UHCJi8A4LhV/BIGVFEyEKRagAgNrhnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338693; c=relaxed/simple;
	bh=nUrrX6fvJ8xXWDGBUO+9oVkzQeBBL3WL+YrpDDcGXjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pi0/4a0RKW9WqFAVLCXoU07VVK+ms0cAjJYJMkC+JfCUvAXk2bHhj/H6sAbYJGC+Wl1BXrxBKIQ8sSP7Jp+cjtVyz5p7J4wXhYQMNONxBsUPrwu3qW8oJaUd73vhV6Lg5rMl3WNdbLhWgeyPh/40IR7MqhK3BvyVSOsArDwrPWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DAuIY1x3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RqbbnNPr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DAuIY1x3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RqbbnNPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/jSTYPb5+iqfnKrVpM0EYbQbnYNP4KDzbEmhzVmVac=;
	b=DAuIY1x34uOgOjq1fmDLVBjc/8Jka4CexY0rUIHQaenVP4/KDn8/v2IpqgAEri3C+xrkpi
	GobYjdRGfOcut+ozk2jBTL5Sx9hADrrUWA4c2OHfFC0FfrHY8Zge1JWJ4NawpB9hE2tDlv
	PdDQqJ6Gv20ZwgrIlPsxkjuEeA9uND8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-QXAkMo6sNz6LSaixvmo_wA-1; Fri, 21 Aug 2026 14:58:07 -0400
X-MC-Unique: QXAkMo6sNz6LSaixvmo_wA-1
X-Mimecast-MFC-AGG-ID: QXAkMo6sNz6LSaixvmo_wA_1787338687
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso16301341cf.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 11:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338687; x=1787943487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/jSTYPb5+iqfnKrVpM0EYbQbnYNP4KDzbEmhzVmVac=;
        b=RqbbnNPrQpdUFOXnIcCmfqjz78gnIKTFTulla98SVS9yyqQxUD+SM6fPZaUyyNcEt2
         iqN12iiMW+l70aZPA+NRYVdTAQvajKeLjy+k7J7HcgxgmTiYjVLY8FAC4TOQsdaGYDZ1
         0fH1HA4vLr16P5bAqXeV8qgN3NGcEywgi7MTJ3IF15bj4Eck+ZBTgMkE8ds2AZ1fL2A5
         VhxfseF5rsEksM7BC9+W2OZAypaf3axoW5Sa4L+Zz9bUkqOJyBTGywWfYvVGnOPkhY48
         cJvq/SxzlwPXAZxHxU7aJJZnSlU83/8tRUfGVjBQD6YyvpfzMQlfmlIKq+ixBawMPVCe
         /z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338687; x=1787943487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/jSTYPb5+iqfnKrVpM0EYbQbnYNP4KDzbEmhzVmVac=;
        b=qQofsA+3g5FRfujHttHP3FHAlFHCx3ECz834M44xiFD/b/kP2C+6wV/2DKLM7coQzq
         krqQp7vgsdO3iFq4aiqutfuuBmRylOKCPnJhGv1niUhDe1bp+qOJgl/gqKa0NdL28Eiu
         klugASl6p6toFDV7IhVBi9AKMqeW/3ViUdNQdBY6tARGheD0nIka1iQsloe2/FflL1EF
         OUv9SeU4hfTwygzLPLpmm89ZHg5RETbeNOZIHhjgrwN1Gb5K87NvPF2bG8WtwWg115mM
         y2y8RqStYVEWZmvt8nQYTCW8EL3FJMlXJnAH4Jh2qI0R7Y+tIN9KJrQNlB1Fmm+u1Nr7
         4R/g==
X-Forwarded-Encrypted: i=1; AHgh+RpyaS0+VwAm3xcraSpz5QAaH1MpFzxeAUblkrR2yb8s5fqlHCOLC5gtr+KTkVBKxPoKWPLsV/9uOdw=@vger.kernel.org
X-Gm-Message-State: AFuF++lZbKUx3wDN52e7j3d8ZviCrPWBlAOh1uLqZKECm04ZWfvr6HTG
	T4XY/B9bHk3EAey2PnkKEEbs+GR1qgdZaYN9a4vCswy+nevEGNoR5+BP97S+AdWCSBd/e0ylN5a
	rjOcvl9TVT5WqFLlXgK53DsRMo5gyP4GMPjvdNoDIcSxK1gDL6lXWrGdv+1pEAg==
X-Gm-Gg: AR+sD13GnyhxY9pcl3x1BQvOVBmqLC2svx5zvHGTdMR0oKIiv9urywy/axKhDdeypA3
	mTRhA0sH0O/6YutL9+5rPz1ndSoxj6pHVOJ7l61aW8OWHDkAVbKt7HT/pXAKOJdEEYrU0L2e29l
	Rw+QD6l6c2gZALUAJIO3qhK/4e4w1t6RszI6thmEaMOPQdZFK7AcycpmxUAWPYIarGdDuSOMJ4i
	BjSov50Un5uO5MGdH2w1gtuGJAFqMNW8OlCXsfz+LVagodTIftwn7Z1pZyWZFI6PHrAzrcA91G2
	/2EB6GsWbWYzQoQgdSWKCHHaT0vDMDhLprAMmptWPIEr37ALtA2nleufA/5mT7hiPgCgn4R3J9z
	VQoyO/nS0uxMkHss55Ged9heU60QBGa9D5PcN5UWOOxTN
X-Received: by 2002:a05:622a:1353:b0:52d:74ac:6ff1 with SMTP id d75a77b69052e-52df5a08383mr81012131cf.25.1787338687110;
        Fri, 21 Aug 2026 11:58:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:52d:74ac:6ff1 with SMTP id d75a77b69052e-52df5a08383mr81011751cf.25.1787338686645;
        Fri, 21 Aug 2026 11:58:06 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e099a8331sm1163531cf.9.2026.08.21.11.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:58:05 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:56:59 -0400
Subject: [PATCH 07/11] selftests: cgroup: add cma configs for cgroup
 selftest suite
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-7-d21b165b8440@redhat.com>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
In-Reply-To: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.3

Enable CMA and the dma-buf CMA heap. The CMA memcg tests will use the
dma-buf heap to allocate in the CMA and exercise the charge/uncharge
accounting.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 tools/testing/selftests/cgroup/config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/cgroup/config b/tools/testing/selftests/cgroup/config
index 39f979690dd3..c4f7df4f1b24 100644
--- a/tools/testing/selftests/cgroup/config
+++ b/tools/testing/selftests/cgroup/config
@@ -4,3 +4,7 @@ CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_MEMCG=y
 CONFIG_PAGE_COUNTER=y
+CONFIG_CMA=y
+CONFIG_DMA_CMA=y
+CONFIG_DMABUF_HEAPS=y
+CONFIG_DMABUF_HEAPS_CMA=y

-- 
2.53.0

