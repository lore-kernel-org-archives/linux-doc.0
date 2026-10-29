Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254050;
	b=mXsPjm9R9UBOLrAhpSOBPJLokhqpeExOS1jAscY3nvq25Bh+Va0yRjyEbJrmYDquTEVP
	 nUTvSY3Tozl6XGeMpHmGyLnt2mEYoji1KtvlAldY7qBc7BWGxvKCoOTAjZ9e36aNEjB1a
	 ECsgnamVdstEw0frGuIIGUD6tG6dyF3PCPGRvTImhZBMmt15AJsPhqkvHjKUNtFHXLtea
	 Blt8yEyE/OkyBHO8W40Q170BE0cIKtnU3tdL08svlMkDaLejhIGIhorkH4bADrPYSVr3F
	 MROnt2RGTkYV0xa5mRWkgN7jFPti7t1SCpdSOrG96JBWwvsHHLpT6K9f5XFgAXK0lrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=hEvr/hVOQ19MxZAsJUGrC+tPSerEFjUvPXYsJLofEYw=;
	b=Yn2V1GM57bFUjFhPFglaLdfMdKXtXKdNbP5mSu27zuuwPoIvAB0+ZEkdEo1Ub/HzBO8s
	 ehi1RCNHrHhII/kpRqzoVhJteiCx0M4mTJSrYLJ6Z4MBoF5os6sFcYYs8FWwhAdoAb9ii
	 IWHaasJOgdhB1olSMJHz0E+VkncztDrjujgFbUrlOckJkhrHuciOTXLboxdwYMf7ukdFd
	 jFntZfjUpAgHBxkBsfhPjTiFi3l4fNtoeiGNgSgjSzwcZ56+/5aVCe9O9BESnUfP5tsRI
	 QGOZliJkij0yuNYm6514HKVRlz+M1mY1GmH0JRLnKSoaEF12+luf25EPvh7ce1nMn9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=wKCE9Rr2;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080F606A31E
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0080F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=wKCE9Rr2
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e5378b281aso9348005ad.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 23:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793254049; x=1793858849; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hEvr/hVOQ19MxZAsJUGrC+tPSerEFjUvPXYsJLofEYw=;
        b=wKCE9Rr2pHlg9Iej+EfB+fHQaFD30y8Iu8WDDxhTeJdE6aGYQr15Q+KLHymc6gwlN6
         vnUYvr5t+AMhOlR3QljtofN6FTegQofX5SyEouR6+99oQOyuIqA9sl/VpQcNHMItuuP5
         mT9VUR9wnudDopJMD8QrpR63eOQSWHSbUp90w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254049; x=1793858849;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEvr/hVOQ19MxZAsJUGrC+tPSerEFjUvPXYsJLofEYw=;
        b=ET8XcoOs1D7CvhmUVmxM4mslHXcWtcra7ry7InnDs1Cvb05gB2JDyTh9Aw0LNOBLcj
         uO6LHQh3BhDOIwaanPbd4IqHO1D06hap0hytgn6aY0bW1I3mioHxA/BspRxkwVin/GLn
         5S7W41uvQcTDnPTbemF2McLP0+csYs9WsnlrZ68ZtY0N7tbNVXbbgSN6xl6Xoffkrq/W
         Kq03dN9aQPGkpwoN7WBztrOidBFvQ92JUuuJqfQWblC7bWQoJkldOZd50c1a8reBCdCI
         4KJAhHckzAfA/9mnoittPvne7EVM9qwQSQ14vo1VIlPG2OkTXbMu51AF3B55+GHML2LN
         KjEg==
X-Forwarded-Encrypted: i=1; AKwUvBxTXoAGk2RuPKRVDcsQ0JB1aXDRX/KOLDdkMYCQXk1c6dlfuImIeXBySv8thzeKz3MXEJh42OZsF0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTs4khCtx7+lMX22mJAJg4bIc79AnfuiR2fAg90TvwycsD6ZX6
	W4p7wgqX1GVyqjKZU+etK95RaDJVi6UQvOKUAkwrL2lV4OchxdqPDCa3eLdiIs/jlVI=
X-Gm-Gg: AYBFou2ydpLAsG30D4DZ4MLkrumnppFk+VUS+HQLbO70foxFY0u61Twi9JxxLjNdL/A
	eZ1RoZjsM5ZjVSmmHGHV7UEbKQEY+WGgJJ6OpoUVhb1AlGZPP14is54R2Y9sVYdw4c1ImqKcLSN
	dwWmVigjzpYecxy4pT//cK1HytUQTgDrtxWiGPKXJVQFK6wQ8hkOE/LDswc03xIuzjRGoua2gDO
	0VX3Qu6gTi0R7nVOn5aRSud3IkIvxniddhO3WVBIkmyQkMqZP2iPO4NqhJtZXsZnaLr2kzNHo/t
	TdzbqTBtK1jO/DQBDcdQEVgvp4UJ+qU5eaA0loHAS04g8lAYrJ6urjFzDG9lJLPOzH9VSXMDlm6
	NgSCTS8LJu8573rSKiRV1JOVUHDtH2sLa9Wy+9Y/jq1HqUdraFdDZiJp4v690tr18SOPijn7Vhg
	AuLkEXPwe8T5krd5jhnAs8RQhTDbmEuXdlTDVu0G65z5PoLH/b/0csaKd1FoTYx8ap9Qnlj8EHe
	jaMNWKpRG8p92FdjcwKukLjrm14LLTGSc36X4LFvdleOd5tqSwWd5La0mU6pqoS7O3w0GTgK9Mv
	LnQdwGQULKRoEa3pwa90PdOQ96yGrtm9/2kQ4N4+NOPTOn4yYVulPveTV7q/EAGhUKjh3Jhz5GK
	dJld7ICWK9XWZUHsCtc8y6SqDS+iKDMwmhH8PkY8oLEodl+rwFrDf/TsBpJmH+lfwfRJBis+b
X-Received: by 2002:a17:902:e545:b0:2e8:2d05:9780 with SMTP id d9443c01a7336-2eb0005dca5mr43806985ad.8.1793254049153;
        Wed, 28 Oct 2026 23:07:29 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b79ce2sm28521545ad.21.2026.10.28.23.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:07:28 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:07:22 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 1/6] mm/slab: Enable SLAB_FREELIST_HARDENED by default
Message-ID: <2ba9dc862607d70050bbc86fce0091de2e23c023.1793253633.git.chris@chrisdown.name>
References: <cover.1793253633.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793253633.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

SLAB_FREELIST_HARDENED obfuscates the free pointers stored in free
objects, and catches naive double frees and frees to the wrong cache.
Most distros already enable it, and with sheaves its cost is small,
since the per-cpu fast paths don't touch freelists. Measurements also
show this quite clearly [1][2].

So let's just enable it by default. SLAB_BUCKETS defaults to
SLAB_FREELIST_HARDENED, so it's now enabled by default too.

Link: https://lore.kernel.org/all/auITixAJMfLtfa7i@chrisdown.name/ [1]
Link: https://lore.kernel.org/all/179312451613.474906.1475329637924619088@kernel.org/ [2]
Suggested-by: Vlastimil Babka <vbabka@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..17d017e8fbef 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -208,6 +208,7 @@ config SLAB_FREELIST_RANDOM
 config SLAB_FREELIST_HARDENED
 	bool "Harden slab freelist metadata"
 	depends on !SLUB_TINY
+	default y
 	help
 	  Many kernel heap attacks try to target slab cache metadata and
 	  other infrastructure. This options makes minor performance
-- 
2.54.0

