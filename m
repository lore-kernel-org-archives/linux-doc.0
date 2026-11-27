Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795815676;
	b=Tj1eg+tdMOSTL4FEuUhKiDoua+J895+tCLDCRUVb4tcjhA/gqzONd0r0J+GKV+g99IFS
	 0Iv4HDSO5u9C1uphFzl6obgd8B+0lJ2xNE+nNv+CYy1/9UGOqN6G8A9Y2pX0Hz4krMxJW
	 dsdjJtKcwHR5FfdpbVHvO08eSRhvxpQujyOvuz61Wo5oZmX9Q8krSF4RaWshBc0k2uW36
	 9PdXQL/hnxfvPoggW4Vhzg8TjPufKZJN9Y5CSiPS+f5U+CaqiJkr41qYHvFTvL7hDPgsd
	 R/JBhD5HmyBTkn7IO5jKMRRlnehX8dQSO9GbrrdpywHTbSWgCdUcM3JmwaXAZRZ8U6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795815676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GNjJtSmgBzeJqa75AyMuB1FfpMIGeExfgQrDDeRI15s=;
	b=UUO87lAU9j5zlC9Tp/jHO9Z3iR5LVmpvNcglDgFjsQiq+c+FwSrA6gD1rF6npDyshlIZ
	 LPfZhMUwPhkyP1oeRajcZ/MhsRMcqWZj9faeWQYdN3erI/8jOFp5OepENLYggt2HCQVpW
	 j/tNgWgVA8fEvZ0Z4wG/hkxZzh0a1uRxVyUJey5lauGGTtPP9DCL1ARqHDOw7QiTVGd3V
	 WCtpi/H7meay5bTU9GhQ9CTK9pBeh1K4WPUBsdyzepDYHnk6qerTAyyzaYEVUfY5m+FHu
	 yGY2CxxaJTxb/zxExgJ4ZJhO7A3LGwDjne8HMPZw4/7iexpswQChoqc5WNvCqDCvXVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rlJzjc+L;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F74606A327
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 21:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F74606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rlJzjc+L
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so109121125e9.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 13:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795815674; x=1796420474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNjJtSmgBzeJqa75AyMuB1FfpMIGeExfgQrDDeRI15s=;
        b=rlJzjc+LyIk9Bk0QS6P/I8TDEexyuBC3YqrMNuS8l9ecZxXqzecIXHrsa2+jjLCIkd
         AvdgA+lDcovhfWDGGXxDDTraLo/z7WixYN6CS0WFtDPjvWLKrdb2LmuL8SVsyVcmcUAE
         w7uKvqNGQ6fgCtW1/YqXftDsvKWqzLc/etNTUBIImSolgJ458EFpxfvonhxlMSH2he0w
         gpZYXR2cdjzW3qoLBTUFALao2MhHDceARIdwR8T5fNHKRhO5CZKehhou/RRtD33QzCTW
         J9VxQgQTSkBjmppRZyAfVgxgVnOD9jDbF3HW5K6gfIlLPnr/76nWxRQFxdk3GCbefAfK
         3+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795815674; x=1796420474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNjJtSmgBzeJqa75AyMuB1FfpMIGeExfgQrDDeRI15s=;
        b=QkesEWrwe2zhGb6a2YLBYjfyo24A8PIpRosnaoCVJiw2oWgDcyHBgzFAvOs395FRsv
         r6iRf/rU+EqVatSCYogtUOUbc9loL79ZSmgKGpp5N//DlmoHRakJa35+IVQQqDZejJUV
         zQ42QOIBOjy5bSLaUj5MbwL0H6Oqa8veoOLZqSOkNupEBFziKee9fFVoZcZG0e/7Zu5q
         nfPViuoNFEjfamByzH7RqVy5/a1Q6Wio5NSZmnQOYKkBvxDO677VN5ZS9GemCR3oszZ9
         tb5kMHj6dIDvFISHfGf/r9Gw6RFkQU3/Po0ttTGFsGU+iENS11W18lOJHjC7IulA3yRP
         T19g==
X-Forwarded-Encrypted: i=1; AL+hErFve2RkbntbsQO5LrNGRjo7NL2lJB1Bwm0CEjgy6JMfHU1/L7bf/+WW7ZNhTcrxV66xRJ42AM5BDbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uiu+Wz88VkJO/NRPiaGNd9236xbIlJ63fELQJTK0OHFLIWeY1
	7b8t6hfKPFSbhjoe+85Gzi8TT4+ksMYl2lkAZnJwDUfdxOKDC7r22mFj
X-Gm-Gg: AZFdTZcW1gYtZljdJ7Slc1RVdS63r/vQxMjq8vOzzM3qMAxzZdSLQhhb8Oaxs37vRjg
	Y2yoD2msj7X6CXSa6iQsCxSzl/qFRmstgw/8AW+mSwEC2nT2QrqYo4lBLRfh8b8CDM/LA8DGvr4
	hpCFL84Ko0hKxFCD74J7wHrolh7jmJ4vf4AuUdo0iY7B4dytY0yCT3uVI9FZLIxHBaTaI4JrmlJ
	lLLvrlah3fVW6zS8boclxoSoLm9CY58MDPKEbHz60ACDFahtyeQBW3glRFU0e99ZbWpAHzL7jSo
	JX4vp60KgqF83FOdGipewyQBVaiwXuPMpnZyex8T0T7yjmpLvTf/iSv5mf2ACCfpa6KAMqw82Y2
	BnBtBcbaM1m2WiFokLue4r7CzrqZg75WZAQu7kaYAzUfOdSGq3Hu9g0Bh6uS561B0R8Yfp1MQWU
	+U59JOeiS9TmsrDmr36DlR4EaCDTXgy7mWHQdjMfyOyOe/DgmT9EZz/J5TKj4lxeNBBQ47EOxeU
	Zh/xFHDFRA3t1V/H5FTwS7k8ZgjYsl4AGxhWMmYPfViladYmXpKphGlHSNodV/zG3qm3xzXSNJt
	xj1kn5/xbd1F3z4wg1+T2uEmYw==
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr518939935e9.11.1795815674386;
        Fri, 27 Nov 2026 13:41:14 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bbb97e5356sm37714445e9.4.2026.11.27.13.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 13:41:13 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: jarkko@kernel.org
Cc: aleksa@amutable.com,
	alex@amutable.com,
	alexei.starovoitov@gmail.com,
	arnd@arndb.de,
	bpf@vger.kernel.org,
	brauner@kernel.org,
	containers@lists.linux.dev,
	corbet@lwn.net,
	dhowells@redhat.com,
	ebiggers@kernel.org,
	giuseppe@scrivano.org,
	hughd@google.com,
	jack@suse.cz,
	jlayton@kernel.org,
	josef@toxicpanda.com,
	kees@kernel.org,
	kpsingh@kernel.org,
	lennart@poettering.net,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org,
	luto@amacapital.net,
	neal@gompa.dev,
	oleg@redhat.com,
	paul@paul-moore.com,
	ptikhomirov@virtuozzo.com,
	sergeh@kernel.org,
	skhan@linuxfoundation.org,
	viro@zeniv.linux.org.uk,
	zygmunt.krynicki@canonical.com
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
Date: Sat, 28 Nov 2026 00:41:03 +0300
Message-ID: <20261127214103.542291-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <awOQDOel_72Xwjm7@kernel.org>
References: <awOQDOel_72Xwjm7@kernel.org>
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

Jarkko Sakkinen <jarkko@kernel.org>:
> I personally think that "getting in" should not be a goal in the first
> place. I care more about that whaever gets in has a high bar of
> quality enough. It can be something different than this but
> when I read the LWN article about Cells I was alarmed enough
> so that I had to do this and prove my point.

I think that Bacik's patchset has better chances than yours.
I think so, because (as Bacik said) it was tested in Anthropic, and also
because Brauner reacted positively:
https://lore.kernel.org/all/20261021-zeitig-niemals-clubmitglieder-b3973fcebd38@brauner/ .

So I suggest reading Bacik's patchset and say what you don't like about it.
You will have chance to influence Bacik's proposal before it will be merged.

(Note: I am not kernel developer.)

-- 
Askar Safin
