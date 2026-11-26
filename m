Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689901;
	b=HZ0HcJQlQeLtR+EWNFtB//yTu/5UDxdSQSg3rOo9AO+wA4sx9kxZaQpYYI0o0i2FshZU
	 bfZ8ybbCUovkLOMCN4obWTiyi7C7CRCUKIjnnuoBnlthVZvtfJFSlicnuwNorjMrTMLeO
	 pcuiMmI2JIb82EzF0qJJzDoG769JfB7t0YrZnS/XVdzaT8mdt8jCvSScIWElbfQxXA3Te
	 gh30drBVWHtmJbaiYqwi61/rRyYrQXqeHbIZaLu5lriZmVKGEBghW7sqJckZ1KD28c5vA
	 sdz1+X7M/Fe1rZcDlW06ly12QHuesNIkf5JyevJSkq55J5AvTsNreFElDcttRaxOMww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dTzX6/OrqoSYIYFMnL47MVuXS44X2MuyVzOdV4a6oao=;
	b=OVM4Duls96FcjY9N9sD9kP7/Z5KZLoCDyF/RYlTt+wIzUCzWUWd9jBQpwuMm3FvINDDl
	 man6p0tchFw36hHRHikPIynHBiI9Zx24Tz1I93Voe/YVtZp3o7sKWqVJXh7PgghlKEhxS
	 uljhI1GvS0M50+trelAY28+Q/AsLqso83iFsH3WLW+PxeHlyJKJFGUwJkmwErL+f4UoNr
	 y3MBwzxdCHEJe2LnTGkrayuTL8Uv+OUEXHH21V3ulu75VSnAl+ZnpXDR6px+e4qyH3Tiw
	 r7lI0Br1cYiOtcg4K32IJo5f7kWON+RJ0nx0xKpVisJM4VhWlfKjfblM0t9TegNRyBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tR/VI8cP";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DDA606A329
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 10:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26DDA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tR/VI8cP
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e47347279so4154358f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 02:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795689899; x=1796294699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTzX6/OrqoSYIYFMnL47MVuXS44X2MuyVzOdV4a6oao=;
        b=tR/VI8cPcpG5hymT+T1jcM5A1W7L8XQdJUT+lNdQZXkVX5/qwTisGBB28S9PUlJsJ3
         07xKsPLkA0fzaUCLNWHD6ptTWhEJyZ/YpopYg50jdi4XQiqSpBJEduMI9nMjK3kLW/dc
         SK2nfH7/vFX/59Ji2uVyc0V1+f2jvFsSc+bR5DsewBYNgIFkASD7O2uYPV2xtYditdqh
         08vGmNfJZQeDPhdI+4ijTOI+LRWnffKfBLoVsVB1lfqZ0iTk02RXZm27biW8v74SGE0Q
         1fUak9psa8IkZFIMAsMVsPq5d0hSKpbhVb4lo3tv0klvXAWVqs1YAK7Xoz0HGESm7LTS
         hhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689899; x=1796294699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTzX6/OrqoSYIYFMnL47MVuXS44X2MuyVzOdV4a6oao=;
        b=urhQEqi+m9Z4zAtp/Dh0DRkx5olhU3gHwzlAyHl22NDhyyeJLayiV48wJetcqUSz7n
         pfZti62CZmjsGT4mFrIhhvXq9r2HPH0cVb8EnRFqzOLoWtYjtgGbyG92BVUPeM4b0LqR
         D5ygSiZXQyS3CqEE6waE4OFVs+rKd9v6Chr6DmVf60iNZ2fz6Xh6ZRtqxocFjCgZV3IF
         Bw8kBy5hM4Fd4KeChju/ctjIiXgQfCWMHWuZq6FiIzqvWZLEjnbqL1UGD1YPu9Sp1PXK
         qJzXC5YedLVAYA9TDKw13dohY0yeo70LuCAlGqs3RIdeMsjIfwdkuesTsHdM/yTIQ427
         dXzw==
X-Forwarded-Encrypted: i=1; AL+hErFBIKd7dmsMW/Jczlo0eE3DBf8RCv4krEF2kNU/vgBjF84hM/4F6MfzXwEupY5iYUT06gqnLPYfQIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sJzq8P0HShds9lIt04+xCRIwd1Cq1gjpyZNP37fQ6LTV4dz5M
	ddYSmHG8XauIpkW8QSL0nPrT9OTqJz4FpgbqAwYsWFmdDDokdaRekPy6
X-Gm-Gg: AZFdTZcBzqBST8bBZo6EcMeF5PWVwg9sx+ny49LFTbX1sCoRvf5we1A3je4NWaboKXH
	jm9ZBH4BzVf8/R74yfwY7HJI4LaRN/GoDmaYcdRW0nJwc+GjzjitUDDtrWtFnl+9gZagDM95Bof
	4DZSpENfY+7Gm21ptb2tOpBZDvb8Otn4Hehq6DoSgAbtk+cyBLmDsP2gNrGa70Gzl2irT9NN6Be
	A97C7Ud4E3SyvnTFZhj0MHOnuOBP9YBrIrXvS5kxH44mYGZPrKec6ApyctVFmxMHDZUVVrkt+8P
	RGuRFNTlvx+az4i9ca9Z+2Ii5KiEyHLKXWMf2xiNEfCOwDEtmXqUPJUwslBPaFQiKz9fLuPls2V
	IGYmznuU/vGrILZGy0rsib1KukaVG37QRDO1PoO2Y+bnk08mgVLPtSV6ooylVibTFIarpD33kT4
	qzgHH3NZC3rVLC+f94NV+/Womv56bMvCuiZQsF8q1qPjx+va5mCW38Ee0CbvRGLE9IwuGxyYiGs
	h3OEHGapK4thNOW+sAHBwoDCmsGBtQ3yilNxmWnFryf1/P3w10HMuvRKGRoWr2CULGnDJafBWPn
	hZmKRMhcRidCrqy9AxMUlSKqRgf/X2VG0zLRHcVipnWK7KD5BTuiIGrk4WNeRYQ9paz8GG5OaQs
	WYChI6Re+2zXioKX6FGHLvGIppJwSqsyi28IUvx9oLqwEJk413/RyJqd//u+iZ3PI5/Oy2iSWH+
	5kRW4=
X-Received: by 2002:a5d:5888:0:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-4abb532ea79mr37997103f8f.29.1795689899355;
        Thu, 26 Nov 2026 02:44:59 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm40898578f8f.2.2026.11.26.02.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:44:58 -0800 (PST)
Message-ID: <0b76171b-7f2e-41d2-8a5c-102dbe4cb85b@gmail.com>
Date: Thu, 26 Nov 2026 10:44:53 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/8] ext4: Add dma-buf read/write support
To: Mengmeng Zhao <mengmeng.zhao@linux.dev>, Anuj Gupta
 <anuj20.g@samsung.com>, Christoph Hellwig <hch@lst.de>,
 Christian Brauner <brauner@kernel.org>
Cc: Anuj Gupta <anuj1072538@gmail.com>, Nitesh Shetty
 <nj.shetty@samsung.com>, Jens Axboe <axboe@kernel.dk>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Dan Williams <djbw@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Baokun Li <libaokun@linux.alibaba.com>, Ojaswin Mujoo
 <ojaswin@linux.ibm.com>, Ritesh Harjani <ritesh.list@gmail.com>,
 Zhang Yi <yi.zhang@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Li Wang <liwang@kylinos.cn>,
 Mengmeng Zhao <zhaomengmeng@kylinos.cn>
References: <20261113070621.273953-1-mengmeng.zhao@linux.dev>
 <20261120154153.GC28611@lst.de>
 <361c4312-f77b-495f-9ee4-e0b9612b4463@linux.dev>
 <CGME20261124084131epcas5p3098eab1bc134da7aefcc83c646b54a9d@epcas5p3.samsung.com>
 <20261124084025.2101804-1-anuj20.g@samsung.com>
 <3bce3a69-e41c-4683-b1ca-9477dd41a7e0@linux.dev>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <3bce3a69-e41c-4683-b1ca-9477dd41a7e0@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/26/26 01:25, Mengmeng Zhao wrote:
> On 11/24/26 16:40, Anuj Gupta wrote:
>> On Mon, Nov 23, 2026 at 09:51:41AM +0800, Mengmeng Zhao wrote:
>>> Hi Anuj, I'd be happy to help pull our patches together into a single
>>> unified series and send it out for review, if you're okay with that—and
>>> would appreciate your review once it's posted as well. Please let me know how
>>> you'd like to coordinate, or if you have any updates in progress on your
>>> side before I put the series together.
>>
>> Hi Mengmeng,
>>
>> We already have updates in progress on the XFS side.
>>
>> We will consolidate the combined series along with your ext4 work and
>> related patches, keeping your authorship.
>>
>> One more thing that we are looking at combining is the ability to share
>> the registration across files. Pavel had mentioned this earlier in our
>> xfs series [1] and posted a series too [2] which needs some more work.
>>
>> FWIW, we also had ext4 changes, but intentionally started with one
>> filesystem (XFS) so that the common interface could settle first.
>>
>> [1] https://lore.kernel.org/linux-block/4649a20f-aba9-418e-987f-66f21ab24410@gmail.com/
>> [2] https://lore.kernel.org/linux-block/cover.1793751001.git.asml.silence@gmail.com/
> 
> Hi Anuj,
> 
> Sounds good, that makes sense given the ongoing XFS and shared registration
> updates. Thanks for including our ext4 patches and keeping the authorship.
> Feel free to loop me in once you post the combined series—I'd be happy to
> help review and test it.
> 
> I looked at Pavel's patchset as well, and noticed it adds a new f_dma_io_tag
> field to struct file, whereas Christoph and Christian want to avoid bloating
> struct file. Did I miss something, or do you have a different approach in mind
> to avoid adding fields to struct file?

I'll resend it later, how to store the tag is the least interesting
part, it can just move inside the block/ext4/etc code, which would
be uglier, but whatever.

-- 
Pavel Begunkov

