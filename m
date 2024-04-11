Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726E846556
	for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 22:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712875207; cv=none; b=jXkeF98zujj8ZHxRZHFGDlqo3EBCb4pMCDfg900emAXRerz1SXtVuITlOlmF49rcUZRgmSnhpt3QO8YB/DtFV/8ol7jOTnzvM6YXLMHRDG987RUAh4NdR8vMzf6t0dPMikZ+UGWduIaED5G9k0o7HtjiPICZouGGyi7b1wXhzs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712875207; c=relaxed/simple;
	bh=S4TnsFcjuXgA9nuQRAvIeS3/zSNBm8/9BgUmS0MLmqs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ukHZ8uZ8jpCauihr3lylKFKnrHi6TpSB0KnoNIbr+dnBu7pc5TyLeUU8c3W3e0/M/Xen8v6Lk3Kqwa/9buJJg5OpGW0I07TcGlafR1BXS2mqF8TtSqDEBWLqpW2wYgzt2i9cHtf8N1UxR6nYRrF34oQnig0E91eBefd3K6EvY4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=HrE7Vx3V; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="HrE7Vx3V"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d8a2cbe1baso3247801fa.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 15:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1712875203; x=1713480003; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4TnsFcjuXgA9nuQRAvIeS3/zSNBm8/9BgUmS0MLmqs=;
        b=HrE7Vx3VsjO9zx09zpOJKe5SAZpjbJiQlry9KLYoRT4w8RbuXZeMwwSh/XEXQESIck
         gKMtNsMOwu9skWe5ekfDSLBm9kAKGi6YBVIC3zq9r8w2dIOlyjPm54EOXt6ohzfsymWF
         cDzSb8jCYm4lcNa8gKha+9ObHZf9RrEPBm+D1TdrFVFbU1vkRKRrbxomgI18JDI02dXL
         cnJEIiUlTz6UgXyGQUrkOXv+UjTQZKKbD9r7+S62qMAbE7sw33tjxBw+CrspLAqlSGlZ
         MxDn6xfZu/vVjV2ou24iQm57Z6ry3iRc/F8pO+WVLF7OOEwOoFiggiVktAhIxaqG3Nwf
         ilHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712875203; x=1713480003;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4TnsFcjuXgA9nuQRAvIeS3/zSNBm8/9BgUmS0MLmqs=;
        b=bVT/wKuA7ud7JF8oWGtBaPUxXtbQv+USdZCCWuLDS//1hflo393OkGMlTnfee1iVE2
         iCIZqhpVwa7VzKid4oNYoRIovlSisIkJDmMYWkNj/OGuyYQSWsP3s8e/boqTyY/Wc+4C
         5dadaMfmjWxCsSsct2dz8GBWxHsoBNr23jzwBc0OasO+H8wqy0Om4TGYEP+J6uTr2L3z
         Kca5FyR1Fp05Narf6SEq54CuKMbwcEfFfj5y3cJLSpQCzy9UEQltl5bfGd+flJ5cJAVj
         7/Ms+8TY/qLw2oKOykHHViOlmWCt91Q2FuoPvdse1yKJ9NcX0FfyjwcALMyzN3tFcQDm
         2YSw==
X-Forwarded-Encrypted: i=1; AJvYcCUOtehmSZ/9ehmd0D3iUD6uAgWgVtMez6Ks+CHMFh/M7dlW7aOxwK75eT3bSqa2HOWzHU3GQ+laCN8JnFVD7aUwFZsq4ZW4mZqi
X-Gm-Message-State: AOJu0YzLuc722FPm3fSNWPzmr5sf4kKMmXatugLx6MgT7dU2qInkrlUV
	kIET3DVppSXyP0qqATxPwWcmIc2H10g3r6YWXQYo8OjYuC2oFfae8JmZbU374hU=
X-Google-Smtp-Source: AGHT+IGY8qJhojjfCfabFUjR9vvGK5A/WLCfM1Bk52OhJKElMImmd0eUpMrnmf84M99SmcErfv1epA==
X-Received: by 2002:ac2:57db:0:b0:513:eeaa:8f1f with SMTP id k27-20020ac257db000000b00513eeaa8f1fmr649500lfo.47.1712875203340;
        Thu, 11 Apr 2024 15:40:03 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:10c6:ce01:a470:5d20:8e1a:464a])
        by smtp.gmail.com with ESMTPSA id jx24-20020a170907761800b00a46aba003eesm1144762ejc.215.2024.04.11.15.40.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2024 15:40:02 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH] treewide: Fix common grammar mistake "the the"
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <0bd7ccc2-4d8c-455b-a6c2-972ebe1fcb08@moroto.mountain>
Date: Fri, 12 Apr 2024 00:39:51 +0200
Cc: kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org,
 speakup@linux-speakup.org,
 intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org,
 linux-scsi@vger.kernel.org,
 linux-afs@lists.infradead.org,
 ecryptfs@vger.kernel.org,
 netfs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org,
 linux-unionfs@vger.kernel.org,
 linux-arch@vger.kernel.org,
 io-uring@vger.kernel.org,
 cocci@inria.fr,
 linux-perf-users@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <193B959E-60A3-499A-BFF3-EA7B2D0B6C12@toblux.com>
References: <20240411150437.496153-4-thorsten.blum@toblux.com>
 <0bd7ccc2-4d8c-455b-a6c2-972ebe1fcb08@moroto.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)

On 11. Apr 2024, at 17:25, Dan Carpenter <dan.carpenter@linaro.org> =
wrote:
>=20
> It's tricky to know which tree a patch like this would go through.

The patch is based on the mainline tree. Should I have sent it directly =
to
Linus then?

I'm relatively new here and therefore only sent it to the corresponding =
mailing
lists.

Thanks,
Thorsten=
