Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFF4539A
	for <linux-doc@vger.kernel.org>; Mon, 25 Nov 2024 02:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732502976; cv=none; b=dHZ/AJFxGbVYhTtJfV/rb+VEwjEHR1/x0llNJD4vLVFkHy7BnjgNcSnh8LKRYC8v3MdBTXbzpvhcTFZ2RrNKMGMwrIdSmsLXslUgtkeQArK/m/QshsyC6ZjXX5bzWaKgIhR8ij7f4rquqjO+uz083WQ3P6M7hJU2AB14gooOtO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732502976; c=relaxed/simple;
	bh=bwYRKpTNXZ0AgTOqs1gS//e1QnOtjbZbYKsvZm7kMzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EP0kH1lbAaaVwTnQewEJB5zUnMFIWmn+9qb3HLMQeG1DfwGPrE3rP3hCBzG1KH58v0kMx6d6ondZSM57wpE5yWQ4ZDNz3Slrd24vnOyuhHTbtV4Z4U5FZAtrhNow0JZ1ZNdVJtN2DqUya3Sz2uNcI2dh1rbowtBJm4MwLEpkcYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kd3d5/Fo; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kd3d5/Fo"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21290973bcbso38037405ad.3
        for <linux-doc@vger.kernel.org>; Sun, 24 Nov 2024 18:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732502974; x=1733107774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bwYRKpTNXZ0AgTOqs1gS//e1QnOtjbZbYKsvZm7kMzk=;
        b=kd3d5/Fo2OZX9Ymg50fN5DYcFVn3RgmucW7OOvhqNeWUawGyR89oIaDJ55g57iXmNx
         YUH3hKowTW+iLVhr8o8zNJuVGmhC90F9woUQFoaDD3lXbDBVcuy6KNGzY2Wnrpjd2MF/
         T4lCHATJZgLxhvgCRXXkklbKVCxyBvtxNK7Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732502974; x=1733107774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwYRKpTNXZ0AgTOqs1gS//e1QnOtjbZbYKsvZm7kMzk=;
        b=RKvs/mQqxZb3k/j257PC/yxwYn2CLQbmo/8Zlr8hgQpz5ImR+TeFZHuHGg93eeGee+
         Xh1dk7j5isFU3iLLncphYE5OSaxwEz4L3EIHwWDHGLxQtiSiEyf9FQNFrFZ7K9I0hKHr
         uB73illhBsLvHXhiztRFvXo3yNETmP5TAJ1uhY0xmtbmen0nJvwJ23jiovUmwXDfY/1Y
         zXybW1vlf02HUsoLARe7J6iie8FVRIMRD5ISjz+shQbsDzvuHMKCvNVzSntEUz0XGECd
         zrGpLsuceTuBe+0x/6UQmYsEc9KrHDh7aMPmzUtY8q/FOpYZay3c4RjMefELlcbx+/Oj
         VQNw==
X-Forwarded-Encrypted: i=1; AJvYcCVp6k7zht0EJeebTH5dDDrqs9fRf/E5Dzm85JJmo/ByjnsgJGorXtgU6RIOvLtqCNIQqXryz4EXXs0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Yp0rscnbxwl5dsE1Uv3vevDSddCCYNPEZ+PTWDh+1XO4IxM4
	FYmEVCPGOzBSTxj1t6Q18gfD7qoH/foLE1MWz60cfs7QH5L45JHAnEV9Kx+XNw==
X-Gm-Gg: ASbGncvIbGW4JYBOamMc3+N0uC7WtN6gtOhes1/YNk1+1DAm4bC94eXUGYNSUdNOZHy
	GBAJThDG1tVW7G+LUIJYqrmg/G7lVhk0hzYKnxa3JvEslTPrptFZ1hGm8dxJ3mjjuEJinAzigqO
	5vIdPpeW/xFIRt6xaWHlsItYyMsoDbYWvDy9EgjgPopZFYZJsPRwAWILX1c3vMNaqI35NL5HWYP
	eYnnGTSyVvJuuX5wzA2AWsdvZn2v1opLfNk9x3t9q5nU1bwTqkvqA==
X-Google-Smtp-Source: AGHT+IFVP5SVaL1qF/f5JvchALO9YPXcNoBq6pXemW0DxAs2YPUHfvD451iNdYYTDbidp8QZ53Fd+A==
X-Received: by 2002:a17:902:7241:b0:211:ff1c:e611 with SMTP id d9443c01a7336-2129f576484mr125711635ad.30.1732502973648;
        Sun, 24 Nov 2024 18:49:33 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:4ce7:266f:8012:7e3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1fa27sm53479635ad.225.2024.11.24.18.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 18:49:32 -0800 (PST)
Date: Mon, 25 Nov 2024 11:49:27 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Saru2003 <sarvesh20123@gmail.com>
Cc: minchan@kernel.org, senozhatsky@chromium.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, corbet@lwn.net, terrelln@fb.com,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Corrected the spelling of dictionary in the example
 usage of 'algorithm_params' in the ZRAM documentation.
Message-ID: <20241125024927.GA440697@google.com>
References: <20241124134550.69112-1-sarvesh20123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241124134550.69112-1-sarvesh20123@gmail.com>

On (24/11/24 19:15), Saru2003 wrote:
> Signed-off-by: Saru2003 <sarvesh20123@gmail.com>

Can you please resend v2 with:
- updated subject "Documentation: zram: fix dictionary spelling"
- perhaps a short commit message is still needed
- I'd also assume your real name should be in SoB

Otherwise looks good.

FWIW,
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
