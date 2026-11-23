Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455462;
	b=FA9ybW9s1BGqdHpgLO67VdKohlME5adQ3o0bWV9KO4ZR494ylHGqpwpdDf3TnCM/Lyre
	 2tvmzh7uJJraKbqxXbRCworKm1axwBVCmcdOg6vEciMjmUEG7sahxe2PWZsLsgeV4a9sc
	 k6K7tpbrOzBwacOTA/OIB3IJqIZlSPY7EdRUP6vPUt1ax5/G5EUb4F7QFGBtXVEtxvYtH
	 Xh0dOj2/znBryN+FhrMkZvpTq+q6DvGtzMVmybuOKET+RO9ZOLqDxdaO0SpOSGuyOwelj
	 m6Gy5Dmw1zWFuXBWcEwKy8UQpMWRp62XC+dHejkssAVyaYpp0G8LMPrYii5/Dxn4kGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=PZHBxkIsMI/Qp+ucOhJHKVnTKpB2RmQ5oFbvkHFx1xQ=;
	b=QtXFZBQSDuI3EgrpPteiSgCrlQ5qc4m6eFviGYa8viErhbLTho/IOQG+R8SgVegZQYLI
	 xJl7hV62PqHVuwLn5ncWTVpxtGz42cTBnUgotpfwftW7HofNOiFV5EvKv2KhG7qAexC8i
	 /LkBJsUiZjLgqHB2GfZEVGAAbAoFvhKYuLqBqZb4FRDBVN15kuVfZRmwGG6nUJ/wTok+v
	 ZcelLUozPoQ0cfXb6xuW9R6lmm2xYcxXScHbcoYyDZ0WCU1nzR0qvJkvNCicnjI7laoLY
	 /5OX1bzHwY1/tMHG+PMf/IR/JXCfUMZTtYprziGDCRFk9O8eK3AAyIECTwA3W0SJLBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VYVpD5wf;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F3606A31F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 17:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B66F3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VYVpD5wf
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so1376118eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 09:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455461; x=1796060261; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PZHBxkIsMI/Qp+ucOhJHKVnTKpB2RmQ5oFbvkHFx1xQ=;
        b=VYVpD5wfa74CIsUOhwOLmHaIx0jgNukFutA+ej3wwKBfBtCocNDEhdcAFOZy6EUyKZ
         T254d8h5ZXOw4ccDS9SMA+DN5zXuEirrNzMXSb1g6atq10iUu+dHlWXBW9J4e9MP6BDl
         7Z7PIK3lqT0IxFRUMgcG4atlr5UETKTYvPY1P25HccwIkOZoMHmANHttrKlOoYKG0ODU
         tBAi21DxPOH0jTFrujL+5ULXJ/smmHnFLhJ64ZdrNG1eS6AT/+kJe2QFML40Vfl9bYYE
         6ztxVeoOzAad3MsO0c+boCpgboQCKLo/+AYnzuG/zpGLx2nxLLXTR3Irl/zriG8rm9Mv
         SNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455461; x=1796060261;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZHBxkIsMI/Qp+ucOhJHKVnTKpB2RmQ5oFbvkHFx1xQ=;
        b=NPmTYWez2VajZ9fmPQr2lqGM57ItcpEMkng4wvsEUkkTlI5aI6O+4XN1DEZNC4pXDM
         mUjd4oFm0cBdbU3PZcWxIRZtQZKXLDaa92VrkLm7ghNJ4qY5jSmYX+0eeSkHGC4rziWQ
         BsC3cmBNtdDPIyzgIxGOSRncsj3OjT/S4kaoq65lPOB63hpkeHCFwqFyeTjevn/wyoMr
         ZBbPlIjVNRssrBNq0v3KKU1cvbdzzy+6L63SslEoPCZUA6H7ww6y3r5CW4RaTjGqwBsW
         FDKuiRKU/KQcaaa7Xj+0LLC67mpiD9yhrBROYHGwYPHucvvb3ie9SnB1AVdOvFNoND3p
         LyhQ==
X-Forwarded-Encrypted: i=1; AL+hErGra0DsXVrNlzA1AefeCuhxdbD573kj6o9UBjvzCGzBkn+y4K8ua0JlpGoZo/P7H9xdSluICPQ966c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v/J414aY8syW6P4qTnvXq46zZwizuIlnQIXVTKdLOyCBWzbjL
	uPE1RlVY7vMowtJvhed3+6YZ2/9Bn17NePgvzvOG+gR/xE+CfUl7t7Ny
X-Gm-Gg: AZFdTZeyB9mTCc+z+Zyu4gn9BFgKLNlgJ493rbqrWN2GKUOX62DLCAjSOzE+QwwfVVx
	d0Hvd2jOp0VClT91qEv3hl8+Gv5sJ709/rQzYfoWORB+wx+hXnEIARqdRMP79BkmZdzGzvydu3W
	M4QdTu6bOLenFQCBODrfzIg1xTcEUo/JNWS5t6TMyw+YaswPlo8v5obr4V9GfXC+s3HgwR+ufUg
	R1174OD3Hh7q+a9oL5WLocbVnUMKexdGegYmo/VZl4hXqN8Jb/52SQ4vgzcAIVmFNZo8s+CbU3F
	XM3f8TKwKkb7FYZ6xUZ+e5W7ECvtvXC5VS8tiZrCsP4Yh4QGH4BFrSeq8Sjyk1T34dELUbErNxs
	Wo0fHEqRK/r9rEQBWM4aigipi+IXCLjalHYGdY4pWWOhjwxUOo4t6NAgXhhqlkMUYjfvUSLHwM6
	mrthOQBE427N446U8Bbfck9/dDO+k6BfBsABdU2pAZW6PcaaEpSIdrTN3S2hJkP0p7J0UsSUdnP
	yq96/g20QRGG6KYQ62WJ+UVT4WHaUy8ttzWVmg1XTYV8YOylbF/mw2rJlQlai6pFKB7f51WkBaB
	4m9ZFng4wdnW5z0FPVa5u1fW64bEYR0OzLrfivWDNr6HlOQB+c/hmu5SEIb+vb3qdLx9MYcGniS
	sheo1C1kd+jKRgciFxOJISWGgOkjwGtNWlz2bPpySlVnntXuuFcyHbmbiKmK2Rw==
X-Received: by 2002:a05:693c:87d0:10b0:386:b823:d6c0 with SMTP id 5a478bee46e88-386b823dab0mr1978021eec.4.1795455460957;
        Mon, 23 Nov 2026 09:37:40 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm31532302eec.25.2026.11.23.09.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:37:40 -0800 (PST)
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
Subject: Re: [PATCH 17/27] Docs/mm/damon/design: update for report_made
 probe filter type
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 24 Nov 2026 03:49:25 +1100
Message-Id: <179545256508.4.18069260923134156169.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-mm@kvack.org, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261121210013.130397-18-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org>
 <20261121210013.130397-18-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Sat, 21 Nov 2026 13:00:01 -0800 SJ Park wrote:

> Update DAMON design document for the newly added data attribute report
> existence type probe filter.

LGTM, thanks.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
