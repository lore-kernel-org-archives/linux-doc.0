Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972AE1E0B86
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755182233; cv=none; b=BM9HH/SS93HEHrPMNGD6GRMEsPBSdKy+J/5V6p0OrhytYUn1Wc/xEWdA4HQMmoRVIwZtF61P76qxRtWb12pEVaWKft9uS3oC7Gs5d3OSm9EjciRZ11ZR1+5KkKpDkc3iNMYXC3X4PaMGyAITaOYpVkknxekyjU4EU0ITJnmFdBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755182233; c=relaxed/simple;
	bh=NOpPaMEGwARq4CHAFNBf771d9jPnS5ZeE6rfKhlvASU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2Ykeo10mNwrmh/+gQIPLI0pDWgpj6o7QNQwBunwnae1QCfR5KGZZKYGCIa7mx3eSeovkg2HHjcIRn3HNZBChKXBW7azlmp4mcBqInbWzd9rCSk2aCfS4ijyS+M/gmZy8+zeo8Xt1pCsehT8hX9R5695kjfax4tfrjsOR2LHnIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=KQNJjeAf; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="KQNJjeAf"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b109919a09so13204271cf.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 07:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1755182230; x=1755787030; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=thFJCyGfhvQRRqY0DjMQa3Qo17IKtZ1G40gUR9k6ews=;
        b=KQNJjeAfSoSwUDRw80154oLg3NjJYeTUwz6KXDBkYfQTu8vynYQjQRzggbRtxTurRv
         L1oI7K7IHGucMXWSh43/r5zPlnon/WpknKv47HhPAwiY1H/gITEGb+I8a/WvoKgR8SpP
         qeUdiB/FilITBvEDt1dY4jA5A58cLYBl/doa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755182230; x=1755787030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thFJCyGfhvQRRqY0DjMQa3Qo17IKtZ1G40gUR9k6ews=;
        b=ugr4xdeRZd+6DSoZb3j/tvczyCscueKYN1WK2SnXIB7Nawuh+UlSjGz59HK0BavAqz
         JRcaHuP5WU1VITBp5aDP8Qa7gSJeIEGusmXp6ZKbe86Nj/B9Jfzch6nMlGqwDhamqkAm
         qsmjGseCCwbE1/fpSIKr7o3no0sra5N7/Vetg5m6N44ztmNwWPiPhswwfwelyAfq79dO
         RZEPjPi4TjxbJcINBSeAhh1GZHekXOGigHq891NDwHaOlb2SYO26lWySNzEuZjLp3q2j
         VZAEm54Xwp/LfVt4M/e4X8TUfs1zUyivIaoLhacFUb98tqeNgX4KjefczP3qTV2hxSqR
         nLfg==
X-Forwarded-Encrypted: i=1; AJvYcCXu9zCVUdw7qPLgJjOglb9Hw6PgD6Fw7tUXhZQ3/O2wTwW0KN7jECcc+iyP0NJgmM0NqzgkRui8y78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpXiLagQPKeuH/PiQKs1G0E88lKsXvl+JsMW7pr81XPSzboxlT
	IIhZNB/7xVsoSWYD332iKn1d3/LWVtThBVEgdlZTV5TEa92v50GuPuLGQkLqWA1YfAsaf22QXJh
	ZbIpYqVaXhCTn06vmyEensNene/eGdBXfTnmEcWJuHQ==
X-Gm-Gg: ASbGnct8A5nCl3xKygCjLflwJy0IOAONsYGasBNJHWtQg9wNMQN/FKpzWUr5235MzF4
	Ha07odwjf9oweR+jZCOx5N9irn5r5yHh8xAw5uw4n6mnFppQfOB/7daONsMErugq5dGqhCc27m/
	rJOOWck7wg5LAR71igdoDj5UciR1x7QxMNKFJKfuDomLpScrVYuoriRGfP5A2AUKHinqh7t3NmL
	tTa
X-Google-Smtp-Source: AGHT+IHnfRI5xHzwEiwbnlj4w/zFMDDNEEaatcq1mpqAAB2GV7mMF1beVsw/Q/x3FPL39V74ikfbsx8wh3qug5aBccg=
X-Received: by 2002:a05:622a:1926:b0:4af:15e5:e84 with SMTP id
 d75a77b69052e-4b10aae7b12mr50528031cf.42.1755182230192; Thu, 14 Aug 2025
 07:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703185032.46568-1-john@groves.net> <20250703185032.46568-13-john@groves.net>
 <CAJfpegv6wHOniQE6dgGymq4h1430oc2EyV3OQ2S9DqA20nZZUQ@mail.gmail.com>
In-Reply-To: <CAJfpegv6wHOniQE6dgGymq4h1430oc2EyV3OQ2S9DqA20nZZUQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 14 Aug 2025 16:36:57 +0200
X-Gm-Features: Ac12FXxrfsSu-05pCnMumsCzYXADqTJ2OFTZfF8uQPidyp6kmWUcoLNSx-lr5VI
Message-ID: <CAJfpegv=ACZchaG-xt0k481W1ZUKb3hWmLi-Js-aKg92d=yObw@mail.gmail.com>
Subject: Re: [RFC V2 12/18] famfs_fuse: Plumb the GET_FMAP message/response
To: John Groves <John@groves.net>
Cc: Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Aug 2025 at 15:36, Miklos Szeredi <miklos@szeredi.hu> wrote:

> I'm still hoping some common ground would benefit both interfaces.
> Just not sure what it should be.

Something very high level:

 - allow several map formats: say a plain one with a list of extents
and a famfs one
 - allow several types of backing files: say regular and dax dev
 - querying maps has a common protocol, format of maps is opaque to this
 - maps are cached by a common facility
 - each type of mapping has a decoder module
 - each type of backing file has a module for handling I/O

Does this make sense?

This doesn't have to be implemented in one go, but for example
GET_FMAP could be renamed to GET_READ_MAP with an added offset and
size parameter.  For famfs the offset/size would be set to zero/inf.
I'd be content with that for now.

Thanks,
Miklos

>
> Thanks,
> Miklos
