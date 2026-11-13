Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606154;
	b=JGkY+TR2S8KKAWZPZau6C4Ho6vS3NNqJ+U9/QRO8jTRv1GpoAhEV8/tl5ndeQtT2l5Sr
	 +AUodyDJW5SVe+o4vyEAIjogDNculMs0UcC5vz70qj7ejnJ9mVd8CCkEDkmbTS5TGFOCC
	 bePoFgcnLB17+F2fpebpDXkDtH110SVKPl2+kC2dknHWTXh+vlsAdPV3zoB+3zdPJG4ie
	 PS3gTEfdZaawSMS33O1nLez65/X/BdgIZLUrSIwzhnioor+8+1ObsGxN2wcqfW8jr7xnz
	 d5/6YLWMlc7F7o7dCEDW/Xyj4Hg5qIjJp4oGVfiSO3QCnsWtqxWAbmPjran7EOK8TBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=RwPRyHP2zyVmejGR1uh4JtlvqhjIfEODs3w+QBRfcJQ=;
	b=PqDKQW4LR2/gXM3fCdB6ZUxxRepkK90nxURUzyxuik7cYjAEd63+XvHjN7U+tyQcY4Fp
	 RCTnFyHA0CUdMMMyrGXi72LD5u9y+R7ES5W7cC29osCLtCHkJZ+77fcyHme4vxGPeUzBk
	 ToxBmy833TiVINV+U2hsGUY70yz06jypUZNSaRRufIt/DAihQAxTuNL7Ied9foJO2He7H
	 7T4GIIoDvaHLS0jChnAC275jygPdx1tEsCcekJr4dNOVhkW7hf9vG3C9O3EHh5xEOT7aD
	 7yzDErI3OlQ/JcDwCeTvkbreOk8NJyQA8x6CtPBGQz82N/yNlUyQ4UDJzujwhjols6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EKNhbxkk;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24697606A336
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 21:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24697606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EKNhbxkk
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91eb449364cso28628546d6.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 13:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794606152; x=1795210952; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RwPRyHP2zyVmejGR1uh4JtlvqhjIfEODs3w+QBRfcJQ=;
        b=EKNhbxkkQMORETffHCHxv+E20muavs46wHH6TSQgkwOKnkMBWgo3BRqE9adDNYWjJy
         zQvDt0u803Js/yQ/xoqMXeSOKFrPFOOfSJoo4mM3wToNSHCQYLMW01UMv2NrALxHTu5h
         1BKsWm9UIk97Oq6GlYqwEE9cIn2GNrup/GEMawiM0oNLiEcTbAAlcoNRt+Y3u+jnhl7q
         Ff+CjlTIZlIH6YG34N3i7rGeKp+IjYW/FeYl20DzdxfeXsbexBmN7BiSt5uKr6EoNKuM
         /dW15GIGFRQ4M8aVHf6ioFgdIR2GphR1luRLbU/sLdpNwfOidADbdAlqrJzVjjLlQ4ap
         SzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606152; x=1795210952;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwPRyHP2zyVmejGR1uh4JtlvqhjIfEODs3w+QBRfcJQ=;
        b=w8bQgduT8amxA9REOckYfnEt9OrX4vvqmPd/jKYr9ofmNkF4vxLJA/0mNUFy1IQnRV
         0lkAwgipn7yCiit0mi3g7Sw8OS5kxPTqaYWy+YigkHShgtYWol94WYdNZVTZ2za1zr6e
         T6Y0jnm/+Y7rxGETH67DKs7e+43xf0LLpVKNgsv3mmNVt0ULu+FK1MkmLJm+MxMGUnhg
         w1Za6/IvzrdR5ATOZ2g1gn/03NuRncvJcOEi9el0V198xccdnuaiIvd8snu7tqd4K+gt
         /a+saSYk+9ayA1A3vBeGTg/vOodwhj/Bbn4GMhakM8Jr/Oqi5Z4sJpx+5TxPVXCP6GYi
         vZxg==
X-Forwarded-Encrypted: i=1; AL+hErFKOluuE6woo7r16saicSwk+i0EB/jjJlxmeTLolwN3kkkqrxFa7oWjHISF41yFjcQZW80qG3WoMHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dbqR0v43QjgqAYa4OCTTuWzFJXILNcSOn0zxi9ieYGZ1cW80h
	3CPTz+OS6nMZj/2a89Qvsrs6X2kYVugXxCm47QiPt9HUBmPvvyzJHc4ZQKKfF923WgI=
X-Gm-Gg: AYBFou09nBaQMIaeMQwZrleWD6G/A1TgKF+XWn+saV9Og9vlLyI3Gq/tbjLv4txrfzw
	uaUOhq6pDI6ZD9rNLvy8W6QN71ntDW2qmtCKZDZpoBr4P8ZkeALip036Bjac+jxwMGZNIyK73mJ
	jyb8JQHebqJYnUZYPBltthEhflOObt+uSD1/bvAi4kxkmKOii/ytE5SjHwWeCZSLWvKEsekV90a
	ddJbLdTSnPt/+ABbNl+KiMuoJX9/9yf9B3pjsHCbKkbWXMWdb0iUgto7YnBB3sDJ8z2loVtXZiQ
	wxV4SuDaFjeFufM7ikZAH7V1rlTTTKsltT29XC5WTgLo7XBCuireZyCY4h+bzDpPBSIiRnX0C+B
	LSKaVTATSGQMcs4Dxnjmu20cbO/nszNzA+0NzshDv2y8hhkzzlwPEHwq+ySeQrRiq0A9cxYJlzY
	gmhppwqV7BffwbkIcarp27zmJRlKNzOG1166o4V4cBSBmaSNTlryPG9v/shEsB3wqMJ8jErdj0D
	rBBRc4CQ2d3xqkV1CXz8n4bt0rLp/FxVx1HK67IX/J5P7NGU1ZR0ZWDk3nMRXy3WvT1tXs+n7jb
	MomfV7HClQW7vec6FphFjL6sTwbdsPhi9V8/YZhZcVlQ1xTbKtPJH7JUVitd2y9Zeloo0YVnzky
	AzTbHs6U=
X-Received: by 2002:a05:622a:598e:b0:536:566e:6b52 with SMTP id d75a77b69052e-55ac7564a85mr62222541cf.27.1794606152109;
        Fri, 13 Nov 2026 13:42:32 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0349423sm27363181cf.7.2026.11.13.13.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:42:31 -0800 (PST)
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
Subject: Re: [PATCH 01/15] hugetlbfs: fix integer overflow in fallocate()
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@suse.de>, 
 Andy Whitcroft <apw@canonical.com>, Miaohe Lin <linmiaohe@huawei.com>, 
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Dave Airlie <airlied@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Peter Xu <peterx@redhat.com>, 
 Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Gerd Hoffmann <kraxel@redhat.com>, linux-doc@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, 
 luojiajun <luojiajun3@huawei.com>, Josef Bacik <josef@toxicpanda.com>, 
 stable@kernel.org
In-Reply-To: <20261028-fixes_hugetlb-v1-1-a0a033db180f@kernel.org>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org>
 <20261028-fixes_hugetlb-v1-1-a0a033db180f@kernel.org>
Date: Fri, 13 Nov 2026 16:42:30 -0500
Message-Id: <179460615000.482102.14809359037930927808.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-28 21:13 +0100, David Hildenbrand (Arm) wrote:
> hugetlbfs_fallocate() rounds the range end up by adding hpage_size - 1
> to offset + len. vfs_fallocate()'s existing overflow check only makes
> sure that offset + len does not overflow.
> 
> Once we overflow for valid endpoints near LLONG_MAX, we can get a
> negative temporary result that is then converted to a very large
> huge page index.
> 
> A one-byte allocation ending at LLONG_MAX can therefore consume all
> available huge pages. Pages added beyond LLONG_MAX are skipped during
> inode eviction, leaking them and triggering the BUG_ON() in clear_inode().
> 
> To fix it, calculate the end index in a simpler way that cannot
> overflow. This also fixes the signed overflow reported by luojiajun in
> 2019.
> 
> Backporting notes: without commit a08c7193e4f18 ("mm/filemap: remove
> hugetlb special casing in filemap.c"), remove_inode_hugepages() must
> include the final huge page during truncate and eviction.
> 
> Reported-by: luojiajun <luojiajun3@huawei.com>
> Closes: https://lore.kernel.org/all/1554775226-67213-1-git-send-email-luojiajun3@huawei.com/
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Fixes: 70c3547e36f5 ("hugetlbfs: add hugetlbfs_fallocate()")
> Cc: stable@kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reproduced the BUG_ON() and validated the fix.  LGTM

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

