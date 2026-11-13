Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559920;
	b=gOMjhvYWcq1JVLIpVWZhFuuYmkXJkhYEWxx/wBWiU5qt9hJO9M5jtEjEUTuCw8CM/vjO
	 OcnM74SbGJy2EroEPfjt9dhDhvctWuiI2bX9cUtM/mTbQS+oL/qP3KHJgFen16nHCR4Te
	 jDZ/lGo2yX90VS/UehOAMJoRbgOmmK5WTwTkp5uSW74DDDoNX0TlcrQbQgq/O30PKUNnw
	 QK+Udq44lLlVXS59o2JS4PmuXFDcku7/5KfdUH6chFYIOXA4lTPo0QMCRI3k870j/xEQh
	 JSDNjk44RuJ2kpiF46fAlCQX6Fn+UemYlUmo4G4nRUNw7VIdz00H7KL6MzlGQQrr2JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=d8ixB8K8R172rrdk/LmhJTXU2lsskw0hIUmehvKI8Xk=;
	b=eeyHP59pzbHDSPaPgyynJ82fs2Z+7mK1dNqy7mHyP86q3QC1FHQjVzsygnZphSuKmkwC
	 3FbuTXjIjZD6PO4lixpFTkqjVc7SMuWzYCm+IShMOhNV1Q+zFO7w8zPmITYQmIqWEqVTs
	 KzbtAWQnbrHZFB+itSWmd0LUDpGwnelx34rT28fuGslWnb11D7uFqwXuQU9LF87MtyHql
	 geqLiO7Xpx/DBEmlHguy1CAMDod0muJlaYTA9avfRCDbumKfXp1InwWE6SUEY5LfdXEP7
	 +F3WUVIoHs5dY7PZkg+WPFfnLiK2TuZdIvrrfmRzPX9MZWGWIEGnXjbGOYvz4andD+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=wo3tKroa;
	arc=none smtp.remote-ip=74.125.227.197
Received: from mail-pi2-f5.google.com (mail-pi2-f5.google.com [74.125.227.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072FB606A33D
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 072FB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=wo3tKroa
Received: by mail-pi2-f5.google.com with SMTP id 41be03b00d2f7-cdb9382f3baso214943a12.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559919; x=1795164719; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d8ixB8K8R172rrdk/LmhJTXU2lsskw0hIUmehvKI8Xk=;
        b=wo3tKroanTXQku0Q5OnfqMKYq9yZNuO+X2W6SNK/K+KqSIfeJq373T/eDUMzD8F+qW
         OTb5E8QNC8pMyltEE9uat7XEZhHW3BimWbhRUIriZmN9YvErn51CndJIq1p4y/4bQBll
         TE99QnuUYAnr6Qc5BzQga+/sZqg5s55Lntf3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559919; x=1795164719;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8ixB8K8R172rrdk/LmhJTXU2lsskw0hIUmehvKI8Xk=;
        b=gmdIMjEmEYeivwc7sDF2Pt991a3BndXlF0fxZZjgeNFnj4M5X8oYdU3V1ZrdgPTxV0
         rlux3/P9HLPI3XNIj6bVfc/Rz16sU7TkneOjmGl3aysGeym3nAMZmnZabCGHF7zTJui1
         w8JNKjW0bqRgUriiOKZe77c+SD+qFpA3qkRywkn0za4ZWQ5nlSgQz47+m6/5bZ1JcbGC
         pogj8o6V5GpAMFCqQm/hhQPgbOHqxeKBkevkrqgkp4XVQtPTAa96Tz7R0p3AlbwyGDXw
         5QdfW/K2/5/QlL1e3Wpl1y5nNyhwvKz3utjKT7d2eCG6z/5E/X7lxP3z/mM6bChWPARA
         4T8A==
X-Forwarded-Encrypted: i=1; AL+hErG/WDHcoM/IdQ+MtPdlVjHBhNtThFyhHEtncyNooOEFTI4LadUmfoKR5kBz7AfATIWaXeoEvzWZEvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UZR6u/yF6Z1ETPP+S294zrAFKUtkL6UjJQYhlmfePXf26ZDpl
	7K72wISwljpDemk4vffPKIBSuLHHZlDlFxANxEGbGSBkvFns7u5s1zxDqpb0wJBle0lwRKmzVCy
	ikjVnFPZtlIIyxV8xGw==
X-Gm-Gg: AYBFou0UtJZInvdo0pyUpdrUquT7opGZRmol/DVhMnXawuFQZ3TPApk8EbP6kzNApqM
	xWnPoSShEp7kybvo38O90wTDes3NKbHPHOdUSVbEbPK/TDU8zzUvbyGAWAF/bl3ZvJ5JUDWEaIx
	08U9GmvRhFr5YqiANCdw0ra9IFsKZmnOrktIA3Yza/6fs+FvVAZEKGtSnmWBxDFvq2qNPnA2wlD
	o4zDlBrvh01lGsuIpxQH3K0wYjjr1pCDqq3snp2BPuKUEG8Av9KMdesKRM+EyB2kdijlHBMu7GN
	oLd84GFukgFf8wjusjDM40NwgbILzGCJ1BxcV1yhB1NIZstYa+CH2/6FW17UJsnv8SBk4y1ROda
	WaR+23FBvvNdxu3A5nru0/f0aFrlRIGZgJlVWYp7w3iXnLfyvGMYqUB1Nn7HUsjeuA+5hHBrm9w
	C+7urDw8X8GnzRI/eU7tQ6wPgXZGkHBHh8bx2El7//E14MwkieSV4yRTiB0cZJoXKLiuxjv6tEP
	nAm8Jx1frpedLD7ML1LFfTQOraZp+DbExJzQwd5moZ4jYnKDSqyLPQlKoTCQPETRBd8ErLYLu7H
	F7mmLtIceAGTfBCBClQbvEeNbYyYJ7Y9j45b8UeKTkhkN0UaA2yTpk+GIWBKYyEu7Pl+QgjKpJK
	IZlnHQMElBaRGTvorCgL4twbONvttQEw+F2Za5ybxsdTpigLiXdOJkZKWB3ef+4sjS/KMcq1tTm
	ReDpByaBZZAjTnyQDRdL13lmlyfEsuF7DayfdDR1xW/jlXSjxX0q5b/SAp6MY=
X-Received: by 2002:a05:6a21:798f:b0:3e2:1a24:fb85 with SMTP id adf61e73a8af0-3f7a4dbd84bmr1333192637.1.1794559919456;
        Fri, 13 Nov 2026 00:51:59 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186f472sm907794a12.6.2026.11.13.00.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:58 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:54 -0800
From: Chris Down <chris@chrisdown.name>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, Marco Elver <elver@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 2/6] mm/slab: Enable SLAB_FREELIST_RANDOM by default
In-Reply-To: <202610302113.FB347BE5@keescook>
References: <cover.1793253633.git.chris@chrisdown.name> <6bdc161bd869ead04b3b9a651ef6a83882ecbea3.1793253633.git.chris@chrisdown.name> <202610302113.FB347BE5@keescook>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113005154.79ad6432034bf65c@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Kees,

Kees Cook writes:
>Again, just like it should be. I wonder, though, don't these 2 changes
>undercut the goal of making these boot-time selectable?

I don't think so. The goal is to stop needing separate images for hosts
with different needs. It was never to make every option switchable for
its own sake. For these two, the only real argument for leaving them out
was CPU cost, and with sheaves that cost doesn't show up at the system
level [1]. So turning them on everywhere removes the reason to build
without them at all. Anyone who still wants them off can still say n at
build time.

SLAB_BUCKETS and KMALLOC_PARTITION_CACHES are different. Their cost is
memory, which is real and doesn't go away with sheaves, so those are the
ones where a boot time switch makes sense.

[1] https://lore.kernel.org/r/auITixAJMfLtfa7i@chrisdown.name

Thanks for the review!

Chris
