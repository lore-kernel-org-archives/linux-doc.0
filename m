Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F23644D6
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763655765; cv=none; b=vBgp0Zg9JZphO6uregfUUFz5ELe3W+Iu4QoekyHwftdWobvnty46DGi4RAKT3E6snBtayNq6C8BNi3tnSso9wyIefGDM4U+8mwx+AnRPmlCkyZ7hHFbgtrmlPAcs1zMRKdigZaOJdZLOXeBd2qes/pbJXffR4eEVxAg6nsEB7jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763655765; c=relaxed/simple;
	bh=7/hq/qAmjFUSxlYfqniLHRI8xtWiHQ2gwCcW3fAeX6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZocjWIko3i1WCo6XHLjywC4BqVp2GXMMXCPWLdgvQXSGWPpKk+1rsGUodvWwGf9HxkpIcas3vEnu2ghs7xaeJ680DaXBMGJet42jaKhnP4YEM4f/FqrBAXzL/6vn4oUOgScs0JfGjTrWQKJkA1s9IOpnGoOGwizacxJo8YCr9uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OER9jNg9; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OER9jNg9"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78a712cfbc0so10588777b3.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 08:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763655762; x=1764260562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yd7ElyC8hNAN6UxXUzLg/ixBrwdD5Fw2fjCcLcS/Ktk=;
        b=OER9jNg9MbN7AbsZPJ43pHNnXl/ZxKLcxRdszQO0c06EWxt4agze6/epEzZwIDUsXJ
         XXjJSJS7DeU9YEzABTKllbyb3yLm7DueizuqSl19f8FlEGnHoY/26IVAJk4v1V2BmXFw
         x6+2IRECk0mtqXufDWrVD/B17PA6JMfMnOpTBMAeqaYDABNU9WfVbUtP8AP1A5/EjiQe
         udq3mNP7yk/qKV2691yORRDs5qK8IKcooAHAcU/H8nENlFaFZKVuP+Kh4XEX9XU2F9Hy
         BX8sIn8ooFOWCg32XUw5k8WyUmlvgbrT5IEhdUQ3UNA2mivn9pQZst4PlXscqLXUQuqJ
         jcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763655762; x=1764260562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yd7ElyC8hNAN6UxXUzLg/ixBrwdD5Fw2fjCcLcS/Ktk=;
        b=XhaIDOCaudsETmrPvlEYNXYvGwaV49W9EhLUhYUOuaBpc4s5i5uHh5BtX+hJbjuZ++
         Mnmj7GVllESlxtUxBFA3VTzNYOshH/2sHQfmIMw4IqpXHixNdsYUGphj6g5vnteiQayF
         bOF5NCSu+oEYV/GV4pTP0RDYQvhlyHOBuLL/68VAcl9JvZsqRAYENAmbbEtnGCgKptOx
         5+vBS2AGx4PR2IRrJFfRG/W0laBW6ns0HDCuUzgejLSxzqjPsWpSt1dNTf8ygudHppbc
         gYDFN3U4i6EdKcjhI6Tt9d9++Imd7kxfd6zydTAeC0aKY6EpBEc5jdT3WDQ5D3XwIC0W
         327A==
X-Forwarded-Encrypted: i=1; AJvYcCVqQDiMfNr+Wf66hvfULFGIP8lA+PqR0NJ0ZkliW7Xbi2YQd00jLwT0kYjoDQjuSfve+CmXPKiq9nU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSLmbORvRJ9t6O0ahm7iefhHSHmUgf9qmvxs8J+rex9B0E+ehR
	SSdjs4OFgDGxIjDr7Sfo/Vnr4MIDOYrSdJMcNks1lAAW/beM1xgq0v4N8ixtcCpnKcW1nLRSYDk
	7YEa0j8EqKkdr3Ca7i7CVlQUuPs4nlYo=
X-Gm-Gg: ASbGnctsVQnfdgT92oiuocH89R+3BIwKitTLIZ+/GTgV/hY5WvJECWBjqMXHkZpCqvY
	8gI5iwUx6xXtrNK1DL4r2kHykSL+xU+9oudXR7eFx8kMgPZCHukfmyCjPx2Qy2NZWoD2PK0OWvC
	uIpZcdGlwb1iTvd2jMvZ2rpf5kdn1hN6mfdQHyJtNOxxdWQKQkpHDFPHUf8nwkAiA9bxb+XO1tq
	d896oC4BD3oQw+mILwmVJMeott8H1Me+Nhw02FbyZxdaWcqLH2n9lrRvvUfBwmS25I738GMmADv
	0yNPiHc1myAFcA==
X-Google-Smtp-Source: AGHT+IFq5A3u9+F1TokwS5dUKdaBBB62w3CmlDYwEHoOqj7Ok50heHQTQwF4tD5d3aQanYGQe9sdpFSOXi4WfFNLYds=
X-Received: by 2002:a05:690c:6f0a:b0:788:20ec:aeda with SMTP id
 00721157ae682-78a7ac3bc0fmr27834947b3.68.1763655761627; Thu, 20 Nov 2025
 08:22:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-32-jim.cromie@gmail.com> <aR6GQeLW-sh9-A3W@archie.me>
In-Reply-To: <aR6GQeLW-sh9-A3W@archie.me>
From: jim.cromie@gmail.com
Date: Thu, 20 Nov 2025 09:22:15 -0700
X-Gm-Features: AWmQ_bn4xc_q45O1CPWkB7PGXFRHp_9VQPJxDn7Om1tvqeP31kDpnK_d4gkFAtk
Message-ID: <CAJfuBxxKM_4nxm3YLeCqiDpb5TBB_Hrx0UWOtASTRLBbKmH6Og@mail.gmail.com>
Subject: Re: [PATCH v6 31/31] docs/dyndbg: add classmap info to howto
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	gregkh@linuxfoundation.org, jbaron@akamai.com, ukaszb@chromium.org, 
	louis.chauvet@bootlin.com, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 8:08=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Tue, Nov 18, 2025 at 01:18:41PM -0700, Jim Cromie wrote:
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docume=
ntation/admin-guide/dynamic-debug-howto.rst
...
>
> Hmmm... the resulting htmldocs looks messy so I clean it up:
>

thank you.
  Ive absorbed your fixes into my copy.
