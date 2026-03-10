Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D78134D382
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156713; cv=none; b=lBSUTKzVz5BRYtJQxyXpTKBA+UD0BUZcBIikE18erI4cTL9J8Qab0OpbiWv8BZ1jQyGQCviFv7b0/YHXmzlwxxZDi91diesOlC5a2vznqPPeOdo9IlkV1CG/Ch+8ORBKgKInt7m4bwBB8rWvvDCCcbnn0toXri3Rq8TTsGjSBgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156713; c=relaxed/simple;
	bh=QhBPLi1iDxbVly5U9MYiSGACs31dHL7SvzgwlmIAxq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQFTae4y/9pvDookDbAXuHsT4aabsy1Z1D9qqurr2tG5+dUerjSFYJMMwpajA74NUB/8BGuAiXlLODnm12kiqVo7DJ2h2ujU0MkxE4IqV6ZVU3gVE/D9pCY9kYi/XnARmzGZxGa5aob6CpJOaKbClz8CFNJvt2dALViLH+hfoag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UTUQew4B; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UTUQew4B"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-485345e1013so20953215e9.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773156707; x=1773761507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v8pbaZ9YAWoZlx7Ck/VCHnVUjAHKhIUC4D13TVtcZcM=;
        b=UTUQew4Btmt+CSMIDCBtXN6XF9BcBWoi4qZbdp4/h67xK2jvBD/VVqzHueXwbviVBT
         /nscZrP9WoSkj40TxkD1C918rgEXkBZPS/35Wvh5WkSTTaBkqzKh1R3x5/pHwmDSh031
         kS+e59heXXapaFZpAEeKjqM+OwKdfrF64hqAkjPjoj+3fFP/Fu72FUH+AZxCMyplACgS
         RORu/tV5EJQmGce6CV7FY2ExNCspj+Y/n7N7tT184aX0SpzcFj4UJLbn8rtfAqpksF3W
         ozS+zfuXqKHEDn0n0ktVHQTRv58v0nCEV0G1wKb9fAwHD92RCb/eGGy5T/+xXZFKZsbf
         rShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156707; x=1773761507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8pbaZ9YAWoZlx7Ck/VCHnVUjAHKhIUC4D13TVtcZcM=;
        b=PTBN8lpJY+x7B1Io7P19hDaYV407OFyx73r470Dvag86UJcOIvzkGquOCY9Nyk4Kky
         XNDuGKL2V1C3DbHxYFeozRRA5S9Jn5FrLKjvr0YTmW8C6Aqw6G3EvTyksmYB8M5diiHf
         1vl9PI83oMK82uAr9l+WXG6uzQDdsh6KdxcVNxNW8AzpX8IpbjJ1J9jMybiNDohPRAwF
         Kc7yFHY+XiN1dMQZWiA3zE1IjO9B0dFRcL9dgR6IdbXNsSSeJYYdaLPzgHGOyPwHgkiC
         Ho5CvajeIdzblD5A7Nxf+puKxsGta8tj/ypE19cAVtkt5gGEpvgMpbtDfHUavMq4UG40
         ugLw==
X-Gm-Message-State: AOJu0YyOJyXQl7eMULOqOomoFbf6mFOtUMW9WBwLcJ3FKHpDUmzJp2C2
	qjLYUbXGOW7/Nw8ma/RZipKk9s0IbXIzG2h7bcXeVpKkBDqjkETKh+LrM8AFwEsENxU=
X-Gm-Gg: ATEYQzzFkC0d4M1UgCn6WoTOktJw6C6m65QfyLv/7rwTKNn+nr/Tn0K1Oazu2Kl1HLa
	RLssRkZA0K5WKwyAWRHtfFjyZL+hYUhSA1yIR5jZsHKgTPjiDyQz5iDFZ71zCUBg79OUV0cjEfJ
	9eYg5Tfp81F9EUg4NbwVF0wD8UT4jNOh4iGGRxfka16rJ7B7uE6YAABU7p6Uc8X7fXQ6Z9npylp
	V35gT5LqZj2Tvz3pEZMQSUt6leOu5qFPjEdE6hNnD7w8CqA6eB3/WA7OV/KZrLTdz0k/P0Iy2Oz
	M2m97yDULDu+RgPTbld4h6XrKvzUGvP1TBCvTsj/qZFWKZKFAXUr00w0JMsBbNKZlOX2RakBWAF
	M/BTVW2TLtHPIoAvhgaNe/lgVw28UKHt/haR++2c2o0nZBcBp5syoDBAmnb0T8qBj30xgy/lpVv
	cQp+eWXqkbA++1a1zlJDGYsceAsQ==
X-Received: by 2002:a05:600c:6488:b0:485:3a59:a93f with SMTP id 5b1f17b1804b1-485419b9e4fmr61124325e9.3.1773156707112;
        Tue, 10 Mar 2026 08:31:47 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb85b8sm37867138f8f.17.2026.03.10.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:31:46 -0700 (PDT)
Date: Tue, 10 Mar 2026 16:31:44 +0100
From: Petr Mladek <pmladek@suse.com>
To: hujinfei <3288824963@qq.com>
Cc: linux-doc@vger.kernel.org, senozhatsky@chromium.org,
	qujingling@huawei.com, zhangjiaji1@huawei.com,
	xushuangxing@huawei.com, rostedt@goodmis.org,
	john.ogness@linutronix.de, hujinfei3@huawei.com
Subject: Re: [PATCH] Documentation: printk: warn about lockups from excessive
 use
Message-ID: <abA5YDfTuU7cuq2a@pathway.suse.cz>
References: <tencent_6D5FBEBE0E2FDACC93E50D0893497F676407@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_6D5FBEBE0E2FDACC93E50D0893497F676407@qq.com>

On Thu 2026-03-05 14:41:40, hujinfei wrote:
> From: hujinfei <hujinfei3@huawei.com>
> 
> Add a section 'Avoiding lockups from excessive printk() use' to
> printk-basics.rst, explaining the risk of calling printk() in hot paths
> with slow consoles and suggesting alternatives like ratelimited printing,
> tracepoints, nbcon, and log level filtering.
> 
> Signed-off-by: hujinfei <hujinfei3@huawei.com>

Looks good to me.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I am going to wait few more days for a potential feedback and
    will push it to printk/linux.git if nobody complains.
