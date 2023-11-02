Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5056FAE
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 16:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3698128;
	Thu,  2 Nov 2023 09:45:55 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-778940531dbso68098585a.0;
        Thu, 02 Nov 2023 09:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698943555; x=1699548355;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbS3utF8LIDOx/IwM4ZUyr32VuuQMBP4WTM0Pl29Oac=;
        b=nQUUP5QDlWAzsW7oHXKI4mhx5t5+0QLoqosNDGMbqdubAjW2r+RIfc6BdX87CbUBXa
         RfSfNnjcvXIDmQeI08wCNhfozDg17JFB1UOQmkIykbOhR/+tvQzXPoLZIs6gTbAX7Wx3
         cslXU1SalLJVp0cnr61xzfFIXQDF4Ja0efnuRwBr4IzAJ0wt5pjcgWSH1HCF4yKRfv/t
         dBvay3KmZzEuC4ovqI+hJPA2QcvqcBaxnk/eXa3JUROUI3MEW1bCCrnE5dx/r3ry5SQB
         f0yU3KNuzN6dbpf9+dkyCHrSIcj9FLuaieOsMF4R1rV7z91VnFc58g+dFyPyBhaRmpbk
         3Czw==
X-Gm-Message-State: AOJu0YzobyiVwOcIPB8jU+8SNgmtGteGSmKOEuJr7GtJOY/feD20Igz7
	5ZtUlyIpLtiOth1eqWu8S38=
X-Google-Smtp-Source: AGHT+IHMfeiAwIQTVjKjYnNAgRmCvfmyGFZelencwExZQJPOXwsresjgFo0uFNJXwGUlgaPZKTdGwQ==
X-Received: by 2002:a05:620a:46ab:b0:775:d4a5:9c18 with SMTP id bq43-20020a05620a46ab00b00775d4a59c18mr22576224qkb.56.1698943554846;
        Thu, 02 Nov 2023 09:45:54 -0700 (PDT)
Received: from maniforge (c-24-1-27-177.hsd1.il.comcast.net. [24.1.27.177])
        by smtp.gmail.com with ESMTPSA id h15-20020a05620a13ef00b00775afce4235sm75904qkl.131.2023.11.02.09.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 09:45:54 -0700 (PDT)
Date: Thu, 2 Nov 2023 11:45:50 -0500
From: David Vernet <void@manifault.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, James Seo <james@equiv.tech>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Carlos Bilbao <carlos.bilbao@amd.com>
Subject: Re: [PATCH RFC RESEND 0/4] Documentation: Web fonts for kernel
 documentation
Message-ID: <20231102164550.GA3640@maniforge>
References: <20231102123225.32768-1-bagasdotme@gmail.com>
 <874ji48658.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874ji48658.fsf@meer.lwn.net>
User-Agent: Mutt/2.2.10 (2023-03-25)

On Thu, Nov 02, 2023 at 10:35:47AM -0600, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:

Hello Bagas,

[...]

> > The solution
> > ============
> >
> > Uniform the font choices by leveraging web fonts. Most of people reading
> > the kernel docs should already have modern browser that supports this
> > feature (e.g. Chrome/Chromium and Firefox). The fonts are downloaded
> > automatically when loading the page, but only if the reader don't
> > already have ones installed locally. Subsequent docs page loading will
> > use the browser cache to retrieve the fonts. If for some reasons the
> > fonts fail to load, the browser will fall back to fallback fonts
> > commonly seen on other sites.
> 
> So my immediate response to this is pretty uniformly negative.
> 
> - If you don't like serif, tweaking conf.py is easy enough without
>   pushing it on everybody else.
> 
> - I'm not thrilled about adding a bunch of binary font data to the
>   kernel, and suspect a lot of people would not feel that the bloat is
>   worth it.
> 
> - The licensing of the fonts is not fully free.

+1 to all of Jon's points. We already have to deal with folks arguing
against .rst and pushing for us to just use plaintext for everything. I
suspect their reaction to this would be, to put it politely, even less
restrained.

Thanks,
David
