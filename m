Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554423;
	b=1LCEBRYuy7FtPNoaFDFKnIhNmsuZFpaE3Pl3nIok+ltZjVOMjfKB2QVLcx9NVHTNtRb5
	 QaAZ1Dmx5XEwqpN7HT3EO3VicPQObmnP55ftkc8q+0jC4CJwg+8QDHdxcjKhUr0LFEgEc
	 L/urD1pKfHmGjk3DzUmo3B/F7qENSP+xYnKkaUPa7nLNRsdjM/H0XMsgY17HaXUjYq8IJ
	 ArDCERilmMlabqd+KDUKmBEqJ494J5HzkTUWh+qchJZwLgjwDn4UGvzLmvcCie9s9ftgC
	 WlY7r3n07FAazM6b0hpayhgfCsdriCgW/4S4kTGM9eqfP2sjNNqqqgTfqmhq4Unlczw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=4ukC9+RmyKpMCoo2Ej2X50ZCe3RffRo8JS7sjMrz5b4=;
	b=a10Gv4RosAiPjQ/jK7yjyF30uoPgwsPBoGvz9Fz6yTrAaSOlv+TXaj1+Ii9NYyvTkR1R
	 dLMWo1DHW27dmluSzwkI09P8Wr7bcRxaNUGgXfVdR8MD7R26tNmIAB0lRJvnUjouh9EMU
	 KO6qH9VyplG/aAICmTq6OYI8TVH20vfjDcuJh1iK7ZjiH/8fnKyfBi5FMrX0v8EWkGxwk
	 9a11OjlVesh7mTmEz5P02rbhYdcIyUjOpCe8BWw4k/1UWxcTyiH+wsyzrfe3Jh1Nng2Yx
	 V4c64YkYADx9CDqNtthAQIDb7zy7sQz4rKugvpUOr2J95WyIidtLEiHtREXUxQ5qysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=UI+4bgJh;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF02606A323
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 07:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF02606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=UI+4bgJh
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91c6ce60697so13335386d6.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 23:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794554421; x=1795159221; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4ukC9+RmyKpMCoo2Ej2X50ZCe3RffRo8JS7sjMrz5b4=;
        b=UI+4bgJhJNbQhv7pU4fivQjQTQX/aGehNq+O6Ule9LAPUv/kSn+3YzDkzwyt4xo/KE
         FpX9HfqzRh+tmlh2VTaVA3asUfXtHtlE0JM9aPwNIMPqxB8GcjZm7uyxxGGajyQ6+1jW
         Q7ie2diUq1P+2uyPtd41hNiWtCIgs9VWfCpBZyoQm/Y75/mhzlg5SEz4NbRTLVZNYMA8
         ZVN8drMKsYzx5jyJv6iYsc5aw/JIYvGPg1xCesOhxeSz87YUpVgMXl9dAYzqwbX0Jp7w
         R8E1X5RG+MSEQaNiTQDkjzrQeoswpV3AO66T2E+dCiN1dcN8HlW+CaFQJoMvaGU7fxYT
         PVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554421; x=1795159221;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ukC9+RmyKpMCoo2Ej2X50ZCe3RffRo8JS7sjMrz5b4=;
        b=RA0MFa1UiiOlYNoaSpRMdLFwTDuD2myk/yrpMypZouIyQBOWJkjttVGP6v7oxv3Kvz
         6lDIv2KStSJajSs2Zw8dyRsi7Ltv+jHeEx/t6HTc0NYv73tbnPuGQBhtM97oS9RooqqO
         DQ33PgiF8CFeeoyWD2+4fNmt7K75hfnY0UOjQFQmHMBwjxnIfwZ+Vhy3mJ69DLfCctTY
         JIO/n+/rS08dUTZDaloh6cXXHhTVh9nkq3v43G7H5DA/JH3xXq7gpvRzclAxB0E/vFAD
         xiH8qX43WbSOSciI3pbXHeqZhc7IYNfhgHdyAYM6xUfYdpGh2cY9m496uxpIAo2Cmgl4
         YPDQ==
X-Forwarded-Encrypted: i=1; AL+hErFZGHiMlCKwp3BHzZeQUHdOewG+PIKN1MjigmkiuSsQcENbQdWJ4c23roZeIvCq0XZiS9KO4m3vWnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZOSUZxobdIjDWozvnY5Uw2kQIZX2k8scps7HQ6INZ30x23T4d
	/NlV3zeF01DgqlW9Uu1uWLLD3j+7dCq6I+yBLYlJP+QceRQ9V5L4Vc58OHf6pZhvxpw=
X-Gm-Gg: AYBFou3dEw3P2aKUq76DejjCkXup//Lr0YnAX9zs0Rfq/N24MUls/YUZgbskHSoP/2p
	dfxvyeey4ygSzD18s1U0Ozke2QUpTRuBqYTaxfWY44cA8ZS4mXJPrO2/roG1AUoySX1J9KSOIhY
	Hv2eybmeV892xggXwHfL+NZKAY4biFddjvvbRmcTEMdUEpUiB3i59j7G+LhWSeSMUeTl+y2jMX4
	fqdSq7Edlps+CqCXebqzWNQxpBsfPxt4GOIKZH+a9VLHjvhFSBDaIHqagsOvNq38eFCrn8txjPj
	NHYAI5b6cKRNUZVLsBOusUXtOfrEZfDTINjJmNENSnwsmhTorp8MfqRUjssXYArZr0S2a86WCH0
	6dSUAFLzLEPl6JVwMnsGZuVNKNZ0gGcowt0PIXXqgbufcnzseAQTqA5s/F+C9ahQNMZUFSlO3XO
	+R9YNprptmiTsCMi8D/kEcapSu1gfYtY/YF9hKWBofrRManRkomLXlxc6KDa72DZNd866IEqiBQ
	5wR2f7llk8XIn5I1Iig7zOYjdG/bNp318TviGj3YPMmLr9/y8uQUuxcyfIfdoQkrTSfUQoVH0zD
	YyfpuO++QrJ4rh/51o67m+itNtBByqkkRECidbLMhKC+CGWXGpwnZh6qsKv4L1kWLJ2FyOuY7cD
	15lsPMKYfTMh5t8R+D1VRxQKbPYV1DQ==
X-Received: by 2002:a05:6214:c46:b0:917:a1a7:6369 with SMTP id 6a1803df08f44-91f24198eaemr24969396d6.22.1794554421464;
        Thu, 12 Nov 2026 23:20:21 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d614b4sm14297636d6.18.2026.11.12.23.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:20:20 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC v2 1/1] mm: add source selector to memory.reclaim
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, gourry@gourry.net, 
 joshua.hahnjy@gmail.com, ljs@kernel.org, mhocko@suse.com, 
 muchun.song@linux.dev, rakie.kim@sk.com, roman.gushchin@linux.dev, 
 shakeel.butt@linux.dev, weixugc@google.com, ying.huang@linux.alibaba.com, 
 ziy@nvidia.com, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
In-Reply-To: <20261102070440.16262-2-lizhe.67@bytedance.com>
References: <20261102070440.16262-1-lizhe.67@bytedance.com>
 <20261102070440.16262-2-lizhe.67@bytedance.com>
Date: Fri, 13 Nov 2026 02:20:20 -0500
Message-Id: <179455442014.482102.4069329165987986914.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-02 15:04 +0800, Li Zhe wrote:
> +	Specifying a source value constrains where proactive reclaim applies
> +	pressure. Currently only source=nodes:<nodelist> is supported. For
> +	example::
> +
> +	  echo "1G source=nodes:0-1" > memory.reclaim
> +
> +	This reclaims memory of the target cgroup resident on nodes 0-1.

you buried the fact that you want to allow source=zswap in your cover
letter. I was confused by nodes: was needed here until i re-read.

As Joshua mentioned, i don't think you need the separate cover letter,
and I agree this is far too long for the proposed change.

---

When I asked for testing, I wasn't concerned with the functionality,
I was asking what problem this actually solves. performance? fairness?

Shaping the distribution of memory is neat and clearly works, but why
does userspace want this?

The interface "lacking flexibility" is not a problem in and of itself.

I CAN see why you might want to proactively shape what data is swapped.
Let me give you an example:

---
The global node reclaim interfaces allow us to put pressure on distinct
nodes - which lets us shape which node is swapped from first.

Example: node0-1=DRAM, node2-3:CXL

  echo 1G > node2/reclaim   # swap from CXL
  echo 1G > node3/reclaim   # swap from CXL
  echo 1G > node0/reclaim   # demote to CXL
  echo 1G > node1/reclaim   # demote to CXL

But the memcg.reclaim interface only allows us to pressure the complete
set of cpuset.mems nodes for that memcg

  cat cpuset.mems           # 0-3
  echo 1G > memory.reclaim  # makes progress from any of 0-3

Presently, proactive reclaim iterates nodes in node or fallback order,
meaning it attempts to make progress from the fastest node possible
first - which attempts to demote by default.  If the lower nodes are
full, this demotion will fail and we'll swap directly from the top tier,
which is (presumably) warmer than the bottom tiers.

Enable source-bound reclaim in the memory.reclaim interface so that user
space can have the same control over memcg memory tiers that global
proactive reclaim has.

  echo 2G source=nodes:2-3 > memory.reclaim  # [z]swap from CXL
  echo 2G source=nodes:0-1 > memory.reclaim  # demote to CXL

This lets user proactive reclaim to target the coldest memory first
rather than preferring to reclaim from node0 first and potentially
swap out memory warmer than what is present on a CXL tier.
---

With this, you might be able to demonstrate fewer refaults and less
DRAM (node0) memory consumed by zswap. These are clear benefits.

I would argue that memory.reclaim should operate this way anyway,
and that would could make proactive reclaim do this by default, but
I could see the policy bits in userland being useful as well

Performance may not be the only reason you want this, but you need to
help me understand what you're trying to accomplish.

-- 
~Gregory

