Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C14B210EC
	for <linux-doc@vger.kernel.org>; Mon,  9 Sep 2024 23:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725926280; cv=none; b=hKIgZHITrgIFuwrNJiQRJ+6U3SlbCGrKrcpjd7IqeQ0eFDWIvySsVIrtywvWLPjgGwcPxJQJyxuQGRb8mxfBW08ZtOj1VxJw4AXU7p1MjulncAoqrzPtytq93c8hQXkV/Y4gf2eCAGsSHPM/Xm+yq/bOYEgJ5SHgj415AK1/fms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725926280; c=relaxed/simple;
	bh=lQhn2uPJQmP5XiJdjuiIobzcSaZmDikyUT/yUvUX32w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=BMA7ufh+AgCiExBu4OUj1J5++6BN/IodTG2f+e/wNUW7cCBjjxMgRlrMADKpie2rxmREM2QdmcXTWdNUiq0zPTPZiUx0Oy1jDV9wolqCzs3qw83GhSXaNpqLMGq0+aM7KYh3NtH/HBTsHhtfh4xEpexdhR3oN801mN0QyrLXm2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBNbOW26; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBNbOW26"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-49bc42bec6dso1341509137.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Sep 2024 16:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725926277; x=1726531077; darn=vger.kernel.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQhn2uPJQmP5XiJdjuiIobzcSaZmDikyUT/yUvUX32w=;
        b=LBNbOW26+CjeYTXRW/HRu4Y4yregNmtUqsNkMbhbYf7C/3o/cKNqEkzrQXMKsegNFH
         XIXWqDLTh7XfDKFiyyHGyAwFHyjVAm7NVpcLcsuwI79GSKq0xZ4KE+6h1eNwTjP97BbC
         Y5rBkR4RZ5TFWxDqlzr2Py4gyqUzOr1CC6t4y0uPDfNXF/rarISNSBKCA0AgQ0gJIIcL
         1yUFL/rw9XervPUTxzf6qexZBzQOwfKem6Ih8ht2u33m9V+6LyxUzSs+druxYMTU54B1
         z0gOruBy4w0RqZSy2W+vWxuIo+xPgLtylcaAoE0T5njbvXkFEhoSLv2bZN7hnk4X3emt
         3sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725926277; x=1726531077;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQhn2uPJQmP5XiJdjuiIobzcSaZmDikyUT/yUvUX32w=;
        b=oaEo7acgNsoPtjvC0d7HmmpQH5YSNKTFeKZiJf0UG/NESLxH508TNz+zqFDRNPWtn8
         woCcdpeuV179EMbkbkurLIsig7laeT/1Ix9HiOs9uyg1BkIQiXi6uq08vE+Dq375Vjzh
         mrc8x2ggWlDDju58z5yWJ0jIZauU6Kq3pWY6cOzyATMZtWH5gDuzr5iqSITD+IQ4dc50
         /BgFQZPqDAGlJmhdy8mjuMD7WhkeHBeewFTMj11HiL3vgE2/6+ig1jCVwBMnQtO7QBsT
         W/fm+P5zQZYmd9tGuN2FSVsxYOH865VC9WDmhKOR7D0Hhy9hDF8N7Ya8oBo7c/+Se5Zn
         VyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBsABnN+bzVT13fqubOdzr1DuAdRs6vZehPCzFyA1cqDcflqcEV8u8sqImYryECGP7EZlcPA+Eouo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8OsaM1FI9KQ/3iAna9zDsQibOMUj5HF68p1KSR+UmNHxYQKRg
	M05sbQxMFHK4i8FRylk5KNEemYW27hs5hpVgLuD+iixEqnAMwU/jHyqTeZSmoEaUiLsYt+J+Wqi
	VevaDU4xMx35AhovlOpiQoSnWlZLm3lCC
X-Received: by 2002:a05:6102:2ac6:b0:492:9ca1:d35e with SMTP id
 ada2fe7eead31-49bde0f8b06mt9009668137.5.1725926277510; Mon, 09 Sep 2024
 16:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908192307.20733-3-dennis.lamerice@gmail.com>
 <346199.1725873065@warthog.procyon.org.uk> <CAGZfcdkGw55MKTYxuOkCgu8kJU86jkERfLRJAP+J8Z6=0z1F+g@mail.gmail.com>
In-Reply-To: <CAGZfcdkGw55MKTYxuOkCgu8kJU86jkERfLRJAP+J8Z6=0z1F+g@mail.gmail.com>
From: Dennis Lam <dennis.lamerice@gmail.com>
Date: Mon, 9 Sep 2024 19:57:46 -0400
Message-ID: <CAGZfcdkCcjX0-xyR9UbhnnnnwZuRcKfah+FG+KkSNztj1EHKMw@mail.gmail.com>
Subject: Re: [PATCH] docs:filesystems: fix spelling and grammar mistakes on
 netfs library page
Cc: netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For those reading the mailing list, sorry for the top post. I'll be
more mindful in the future.

Dennis
