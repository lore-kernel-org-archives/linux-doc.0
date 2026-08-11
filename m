Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C9F455176
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 17:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467769; cv=none; b=pGeOXS4//i81uIgHC6GJWrXsH72paO4tcinK0W6fXXkREJbjJ6k7kth9oumivLy1zWOveD794Dj2K8Nrt06+ip7Ncsc1i4UGHEMHBHMD60NRRQgvo8G++cXvSnVcETXnerZ2tiffFQ/1Ypg13j7hei4Q4sU6+u41hrO+vjX+5co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467769; c=relaxed/simple;
	bh=rp1SVqNd1lWzghKHZWBSLaNSQ75mopP8yp8n71kKysM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=miqRo73HeX5z93P2FIl5ez7BK9KolaA0N9rDasg2CulFO5WzhShcaAgvVGHn+iXfk/sWILTQa+seebGTfCzYnVtt1d3gD37rsth/Yc+m+6xLw0UgdpB6fHKrLCGXW0ZhUSXDDwzREJHBAnrYFMqSdXFSa5PcepfbN2vWdKarrzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctcii1Gb; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctcii1Gb"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbedc9ec119so355889a12.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786467767; x=1787072567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NkZaIE/vnqQhC836hZPxdvhdVxGgfRhensvVVjTTADc=;
        b=ctcii1GbqsJXiFkMgUrYYTSeMsGAli6DKLMxKEHzJY6VtINh4RrSXitSlpaAd9C5k8
         E0rj/dtSAJ1stho7xHkXOCFg7/7EGtM/dGXYR0rnb0wyNpCyvqtBIn50PSh3t5e+gYiw
         /IKqMLYCZmAOYT49q7v0OWwRGq9rmKhdr8qa574jjfwS/QLGinxUdgNE6Aoeg/CgqrJG
         sejAdI8+cBmFathQqFgiq4as8FN8sQUNqNbTT1RMY7uTdj/OsIkvS19Uk0ndEHSMz5zX
         6yFnIvN2daMt/Ih+bNMn4Frsa4MwPxZQ4mfRRHAqiaAf96MHE9j2uQodsb9OJoFf4YxF
         eStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786467767; x=1787072567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NkZaIE/vnqQhC836hZPxdvhdVxGgfRhensvVVjTTADc=;
        b=spQ6JfGLxcpRdVVRkOKjzCZANrYRCZWLSKN8Ro4UkF5MHLfJ8rTNS25ln/ChzscpVE
         DttccMeAb1YIkT6+i7bb/fsYOAfFkXtLPREraj1EwQGoI9kmNnJpZWpp+QpdisCW/wNo
         Ycwfte1kUt6uCXjwSSmVweyJN5uvvGtW1Xpudtmipc0i1XBjqJe4gAuQLINhd8z6LmB6
         PPetycRu0k4jNARqauXBwJBTm066UuJc4Y1kQZeBb7ExzR98g6PzwhmQWnpwyLpNck4M
         qsq6jXgv6BPjzmqDz7uMGZTopyH3L6Jo1gDrvdXL6S1CAI4u52hxdL0w2YyvcWr+ppW6
         FYbg==
X-Forwarded-Encrypted: i=1; AHgh+RpZEq2t/7BWu8IU1XlKWiOJc3nACkiZXKnt/tbFp0AfLo3EwGLX0/3te42gbU5XhRNoEub8a8wFVII=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKN4R4h5gSgJlEBaSr8smRKZl/WMt/HUihtLhkXRgqNemdHGSt
	V52KQvY/yhq7CVoXEbB6lnWJ669n7d6DZo7gzMSG8pWp2FuJrliaBFta
X-Gm-Gg: AR+sD13BNDlWGB5f4uiUjlDyFYL9MNOQqIa5AU3KC8S9mZktSb4ksE00JVvgnM+5nZX
	mX3GSrXsC3l6fC7OEdi6CCJxlNx2Jcww5GgyNhr2r4Xl9MTqgEbax6h/sIvaVnlxFr7SVXG9t8w
	3KL6P9/gNxWYReMYc1LRBUcww2L29Mg1bOmuXE3XMZvBkIiBzItfmPnHzcC7EWIKupdTloU1NMC
	mMlCqktq7MJPDbvfWrouq6GSMewaUlC9RD7EqEHJuxu30TEgBI2qmSz/Enx47x2tZPyWKMJKGxK
	zp/pUOHibjQHE8DzQIJsqCg6OyQVonnA2XmtCSQl0SN0jv7CDlE0dW14q6g8pKtfsisnoa6D8OQ
	pieaLxmnVovRyRGYFMqh+l7ea8PUHD10lFQ+8Y6daK62UbYpKfMfpSK01fHvxn1t56Y7HXEso36
	SJOF7+eC7H/n+RSKQznAgoQPGstlWca5uNYz709xNY1fTuVTYpWO4L2EtQOEeZW4U=
X-Received: by 2002:a05:6a21:6014:b0:3c3:8d4c:6679 with SMTP id adf61e73a8af0-3cc2baf91c1mr7030040637.20.1786467767243;
        Tue, 11 Aug 2026 10:02:47 -0700 (PDT)
Received: from celestia ([2402:1980:85a:5c46:85a5:ec7:8aa8:72be])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14124451180sm1073882c88.1.2026.08.11.10.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 10:02:46 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	damon@lists.linux.dev,
	david@kernel.org,
	liam@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	skhan@linuxfoundation.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH 0/3] docs/mm/damon/design: add explanation of nr_snapshots
Date: Wed, 12 Aug 2026 01:02:52 +0800
Message-ID: <20260811170252.32705-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811135654.4901-1-sj@kernel.org>
References: <20260811135654.4901-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ,


On Tue, 11 Aug 2026 06:56:53 -0700 SJ Park <sj@kernel.org> wrote:

> Hi Liew,
> 
> 
> 'hkml patch check' [1] says you forgot Cc-ing below people who are recommended
> by get_maintainer.pl.  Please Cc all recipients who
> get_maitnainer.pl is recommending, from the next time.  'hkml patch format' [2]
> could also help you doing so.
> 

Thank you for reminding me! I will CC all email addresses output by
get_maitnainer.pl from the next time.

> [...]
>
> On Tue, 11 Aug 2026 18:18:38 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > Add an explanation of nr_snapshots to avoid misunderstandings.
> 
> Thank you for this patch series, Liew.
> 
> > 
> > Liew Rui Yan (3):
> >   docs/mm/damon/design: accurate semantics of nr_snapshots
> >   docs/mm/damon/design: difference between watermarks and nr_snapshots
> >   docs/mm/damon/design: fix typo of max_nr_snapshots
> 
> I requested changes to patches 1 and 2 via replies.

I will make changes in the next revision:

patch-1: "tried to be __completely applied__" -> "__completely tried__
to be applied".

patch-2: use two spaces between sentences.

> 
> [1] https://github.com/sjp38/hackermail/blob/master/USAGE.md#checking-patches
> [2] https://github.com/sjp38/hackermail/blob/master/USAGE.md#formatting-patches


Best regards,
Rui Yan
