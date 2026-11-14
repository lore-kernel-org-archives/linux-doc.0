Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640252;
	b=B0rwERUSDSMw/qMKkcnGyFUiYTzm34NTNRRBb9LXi62eOElmVsooSDRsqTHaF/tfXiJ4
	 HqyCE5EfF0zlOBzrHro3GoYuw6J76STL4ZknOXuvjx7tosdgzW/bRunND+P0vlO+eZAuN
	 JUMxz57RD+34VT01kfK+QxSWdB+sVguBqhxHgCThEvvcItyVzvlQ600PRrYFPJoJAY/YZ
	 20oLd92LSMbgEs+tHwTaeYAuVJKP1ar1eSILYNJHq+e+14KLgPYIgtX/vJTb3TY7NJxFi
	 H76p1J5rvgsGHK7vlslF9gz+bGugNkG7NYDG5qBW4bKEEtF1Jn6gX1vV2wMMo3X5gJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+HAKXNFyWuVVus4jyGRYSZgEnC6sp/o+JpWnVYJ3k8U=;
	b=oxl8uN5lBu/jsjHWvIa5xrqCzrw3iicNvDaoOlrPdcIeLb+SBRlA+rm0PI9isgXwi4nS
	 clSQ8v8GWlr+3nBUZHQfrTjDF/vBAZMFRLzWpiAwsSn403fFUs/cq5DytTvGVQH1eBRsE
	 cP5aQBSdfrKfUYg2ZYa/1MbdLN7WjQ5Skp/1ZMnmxiw18k+Z4JaeZD2RYxhKkS32Mczu6
	 k7Nb4fL4I/Ev5vNx2YWrHG2Nkr3zXM/nZ+zwaLLbIf7FhpqblHzv4d9XqcTgpTlRUugW+
	 0Ev8mzu8jT84he+Rdh5yeJoi7Pz6p5ks5X2Qmnx5jl/IrnSiPDbE0JT9VuPGaP+34Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Ok0h8iL2;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BC5606CDB0
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1BC5606CDB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Ok0h8iL2
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55c48582654so5929681cf.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640251; x=1795245051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HAKXNFyWuVVus4jyGRYSZgEnC6sp/o+JpWnVYJ3k8U=;
        b=Ok0h8iL2T10cI+PFEuVIRGMDCQ8NRP8Fvz/7tqv55sIqhrJCRGSWcCpReX+dtqSuP2
         ju0VM52/CASXF7CQSnL43mof+7dO6XSHI47KpeBuNSnTQDrqrEnd3GcKgPAUVOYGauxT
         de4vnDF+SMAr6UXzmWg3c28ZY4rCoWGd8RqnhDnP6NM0npTcE8VtLbuilixq0g2CEYxs
         +svzoJS5VfpJRygWBIcrxBCy0d2NU/KdVMysL9vxlhdsh6BofY6ssX6fsKSm1C5oxNGX
         mwozWZkGrlxN/J/oH5CRgxpsxUUGABpZxa67EC7pTOlS0qAduZMHCi3ioVdjNWNK0FG5
         e9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640251; x=1795245051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HAKXNFyWuVVus4jyGRYSZgEnC6sp/o+JpWnVYJ3k8U=;
        b=gy7u+n1JJgXKj5Fq3tyL8YrPcDg1eS83E78g0+HHEsLVD2ixgpiLa1B94ZoovZ9QN2
         nlmHVaajmiYTgwCkoAPN1ilkLX2WeTp0lKLsPjtvlr7PHjvs50oPdxkVxgJAw3Kv3zyb
         s05gcrGCiGGa5qagiIEQPJ4Mr3V4EBkVbnVsmNynOCfDqf0tz4ZPIDOifKUcklvd/tIU
         ja6rTmZXbpEN0BbA9lol9xOdq2+OnhdByuvhWSqGZSargAdammFOizH96l3A8smH930H
         kqftZpEOE95HEe4zTQSy6X6oOrMFRU7vdcOaNxb0DKzrOgSyefj0ZOmaxEtIsA7wGLq7
         mrHQ==
X-Forwarded-Encrypted: i=1; AL+hErFvwHAs8u5rmgtXNCxefnwBSwVX3GWw9WloC2ZCFW8qc59FaO/1cHlJgrCJ1rNYECc9lWgX7xdR+/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RmpItjHaU5J3wMoQlq228lQmyO4DPOWn+SDYBD0SH6VJWUlql
	T2OdGeRgs0U6SKcmpVAHLlzWj3bqCc8eCy0igUzBPI4+eKh1H8NNOqxjbJBZ5EWFJA0=
X-Gm-Gg: AYBFou1w/ljrNTFXvie4BTh/ZeWlR9thQwcBAqBGMCYnAp0dlnM62YN8p4ffa91KhtE
	BkpMHqiXNKNf8qEnVOrEoehTkWVb2eSb364sTk8ABA9N85XbmmwjMLuSkXl2ByU4+423fkBVsDt
	7/sNs+o/Dl8nDMNbnYxtdC4HcPZa72efLBIwLgaz8RAtnm2NGpgKHo1eTAPdeEFq2gF4xl7k0gJ
	Y6UxENu733K5EpwT03ZMyG3UBw1XcHN+PWFap2hr/3q8OyW6GJ8REQ0Y4XNWi4WPBPmsXgYt21G
	mSO6OJmKJNTantTUPz3LkLzR4a/txSKJZksUEdJfkONemLHZx1ZaoW9fups11dfCbpF3i7oNXZX
	79V+4C1UW7MFdKj9musFmGVgjnqSqSsk+iIDT7RKvmV3e5lpjvFsb8ykBx6hRmICMZ0ppJqwRjs
	eRk0beXlhM5yvw3R1Rb+26pRMz6kC0dlHZzWR4brtciPhRhn/D0oQ9VTTmlukLPb9jVvh0yaCKt
	KRs5PW/mMfmqk3Qi4ghSrlLJO5aMLL6cK2Q4wTx2qHEtqFnrti0atbsBAmrfljG9kxQZuelCVEL
	PbOLzrVC2oPIMgbQNbOREoupXaGvMCoexXeZJNiYnY4+Zkk1HCA5pfFbmC6ElAWmbdWjYFRepkl
	ZfoOk97RQRTV4UIg=
X-Received: by 2002:a05:622a:191b:b0:535:a5fc:3b58 with SMTP id d75a77b69052e-55ac8b9ba4dmr73074831cf.68.1794640250752;
        Fri, 13 Nov 2026 23:10:50 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:50 -0800 (PST)
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
Subject: [PATCH 22/22] nodemask: remove the now-unused first_memory_node/next_memory_node
Date: Sat, 14 Nov 2026 02:09:59 -0500
Message-ID: <20261114070959.3490008-23-gourry@gourry.net>
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

Both helpers hard-code N_MEMORY, which says only that memory exists.

Every caller now names the state it means, leaving no users of either
helper. Remove them so new code has to pick a node state explicitly
rather than silently getting N_MEMORY.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/nodemask.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 7ace610bdd654..eea0ff7601303 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -457,15 +457,10 @@ static __always_inline unsigned int next_node_state(int nid, enum node_states st
 }
 
 #define first_online_node	first_node_state(N_ONLINE)
-#define first_memory_node	first_node_state(N_MEMORY)
 static __always_inline unsigned int next_online_node(int nid)
 {
 	return next_node_state(nid, N_ONLINE);
 }
-static __always_inline unsigned int next_memory_node(int nid)
-{
-	return next_node_state(nid, N_MEMORY);
-}
 
 static __always_inline void node_set_online(int nid)
 {
@@ -509,9 +504,7 @@ static __always_inline unsigned int next_node_state(int nid, enum node_states st
 }
 
 #define first_online_node	0
-#define first_memory_node	0
 #define next_online_node(nid)	(MAX_NUMNODES)
-#define next_memory_node(nid)	(MAX_NUMNODES)
 
 #define node_set_online(node)	   node_set_state((node), N_ONLINE)
 #define node_set_offline(node)	   node_clear_state((node), N_ONLINE)
-- 
2.53.1-Meta

