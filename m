Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08918361DBC
	for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782654914; cv=none; b=IbVbhJ2ZG1Qle53bOh0zeZ+FZRULZOZRJRuhEwpjNmRKHBKN3/XOmuxkNGsPqUy5h4RQ+hoIfWmx+j6G7a5gxWlTE3B505yb/jVzsMJVvVHXLmbqv0oJTtHrp1ktqaWy9uIaJFrnf6NOc1gAZ2oaYgPp3YDVcb77PBGz2vfmvOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782654914; c=relaxed/simple;
	bh=G/Jtpz2dyjwRZd8CQBnGefINIJsyzwvfZ4xUAeMXeAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpER5XaK4IFGIQ1bzPvQpL1cctcQ8VSIqpL4N7Dzt8KfE8N6sKgkUAZmuYaxBds0pMi1AQLRWjnmfaPEhlkfhZemVhDhZMI3ooR4UgrZes+Of8WRWxnl2fxuoYETjsTgT55JohUFZuQ4utphrx4lztEu/UyjiesRNZ5kcul0uyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=kCyY0u2p; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="kCyY0u2p"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-519e7faecf1so39822291cf.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 06:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782654912; x=1783259712; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DNV/A7emqW06YSeGh0bw5IhKLR9YF/fHiPtbm8SqJPY=;
        b=kCyY0u2phgACkIT5UOY80q1vsTHAJQDit1ezltfbcrwIps1AXXDVt+J3/LtHnIhMpY
         UO/ZUa83LXtyMhMXXyeM57ojNJHAnpTbQ3oQjbbqAGMRg7jELULe92UQGG+U8ddCd1It
         JFuVVMWm1VQexfu5wN4n9XSbRepM71K7PcJFaAi81Fo6BkjfX+/yjz+RPDggF2l3Mnjv
         JLFsT1SXdtBoEVj5Vu+BwrWv2/eV1PiIbqyrrHRS3e4HVv66PEZj5KITNpfjf08FY9Or
         zZrkmVNPCpL4r834jgM2K87cHRZWmuGJ8+KsOCNf+KlQFcVXSFhv0TgLqKmToCgLX/LP
         KaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782654912; x=1783259712;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DNV/A7emqW06YSeGh0bw5IhKLR9YF/fHiPtbm8SqJPY=;
        b=NGj7c7dudvMp01th2t1pu77aILsUh43VDh3C89FXTZxeRTSYOBTRsakSWSKyu34/9p
         0za+kzCjhlcplvowViT1qlDluBPXhHPHrFPum7HNunuA2x5MLsnUOIKu4VL376gMfIuW
         UG801MIas52fValxqpi4I0b1BcfmnCr3Dxg/V6XPKoRuMZ7blgXL4txo1HSSuq43o2F3
         Vzls59ecyKLVCFDMh7Mwtc0XnY1tqTcNzI3FABPfevx5PNtb7AnZ1xmLpeadjFuJ67HN
         03VrVIGvzSRqsjQ7tmQx1KU96gHYXwSOnpTlvBQgLQigyWWj8ewCKAX0TdObJlFC8t6/
         KP0g==
X-Forwarded-Encrypted: i=1; AFNElJ/1ZwpI8ArJm3Y6gRfhN2n7R5TW2Ytrt+3MIZGH6Y/hYJTeKLUONvr90dCkP6Pe5NiXir61v8EkuYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHBcDJnphuUUeFzfu6ki/wlDo+5Vt/ubuQyKEN6ug2nbirM5Ny
	59KDU34A3C1HJqf/oiM01NI85CxBmavKCICms8Yjy4xw7WbSeZ9IEp8NapdG+FUqig==
X-Gm-Gg: AfdE7ckFcRetWiJbtHXkfAidYGfw8dbOv83/wDgleRJeb6y6dYT+Rexwu6xdnZjZ38e
	xv/n5CmDvDMR66C0EG4FvBgXTFKE7wE0NE3nulN6KGPq1WYhAq0GBzI7AgDQ0GzVe2OM/RNWbdD
	mSbKeHAvPi+gJ3DsDxsk1gnclQNgXcqsw4Y6OFHo6JnA6kqCi3u7tMtPTmUYM61WQxL8lLaqEj+
	LlK+FSGOCyB5yTbP8E9AeI2NzRZsJtpDGpEL+yIcToO6LOvZ1ByQdT9EvMlr5Wg4kasCQko/xmc
	AuCW5RVA3du7zff4cPVOnLnIIjV6ghfAP9Y2gBSEbA0MNcfHM9byGppFL3+j3QlpNPWhkamxgb4
	I4LPDG/Wf3R3t4B2qbGi/Bn1XP1aqWwAcVj33witUa71SAaYHboXEiA2Yqcr+EAS4zcj/f1yeHr
	pCiNySahdOdhmt31j78hg1mzYB7urq5k6o
X-Received: by 2002:a05:622a:4010:b0:51a:8dcb:d9ff with SMTP id d75a77b69052e-51be5ed80camr62533671cf.51.1782654912134;
        Sun, 28 Jun 2026 06:55:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a514b50b9sm140835361cf.3.2026.06.28.06.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:55:10 -0700 (PDT)
Date: Sun, 28 Jun 2026 09:55:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com,
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
 <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
 <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
 <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
 <CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>

On Sun, Jun 28, 2026 at 11:53:09AM +0530, Nikhil Solanke wrote:
> I need some help with the USB_QUIRK_DELAY_INIT part. I can't figure
> out how to make it properly work with my patch because of the
> following reasons:
> 
> 1. I don't want to move it to the top because, from my pov, there must
> have been some reason for placing that quirk where it is now. so i
> don't want to mess with it.
> 
> 2. Regarding my idea of adding a condition — so that it doesn't change
> the behavior when the quirk isn't set — if the full configuration set
> exceeds 255 bytes, we would have to issue a 2nd request. In this case
> the existing behavior would be more justified.
> 
> So, I'm a bit confused about how to implement this properly. Adding
> yet another condition to fix the second case doesn't feel right to me.
> It would look unnecessarily complicated. I would appreciate a bit of
> help and advice.

If the 255-byte quirk flag isn't set, do the delay before the second 
transfer just as it is now.

If the 255-byte quirk flag is set, do the delay before the first 
transfer.  If a second transfer is needed, you can do a second delay 
before it or not -- I suspect it doesn't matter.  If you want to be 
safe, add the second delay.

Alan Stern
