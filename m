Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72401A5AB
	for <linux-doc@vger.kernel.org>; Tue, 31 Oct 2023 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rvN946id"
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2701CA1
	for <linux-doc@vger.kernel.org>; Tue, 31 Oct 2023 03:36:25 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-4584e93ca8bso2296640137.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Oct 2023 03:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698748584; x=1699353384; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q0j5MzCJS6Nm8YyNAXIMgXvYrXveRdJRWMZSbaeNy6Y=;
        b=rvN946id6K8qhVISfto7xDbiKer7th1bL8ifOUX3aHtsG8FD4a7ii2ML5ultfB+FmO
         n2URzK0ftgO6vrpxYudvxmuZLEuid+hzUbbYqYd2sXqGqL5E/BPAm+Wzu8kTeyTWSDtJ
         MC6MF5YOGcpxz363qk9ofxw8wOSBmImGqD/s7XJ88kLmqqGUdA0YfpyUXzfs6C0q5no3
         3D2ZL+9wnQRdlXaaKlG4/uomzg/vdLrFz9kbq0CgygK8XkPzzFnGltu2t3EneiOuHVgX
         1w0Kj1dBNOgfDlkH7CgiRzC2wkIkexZWxKx5HuTIF2AujDHQvdhLbx1PjYr5ZCKLsEHz
         6fLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698748584; x=1699353384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0j5MzCJS6Nm8YyNAXIMgXvYrXveRdJRWMZSbaeNy6Y=;
        b=YxpsDiwgA7zQHJYX1Cz1lNdxBKK9JB38MErgpZNa21nMts245L0EjVgh1a1cYYOHsY
         /1dDEKww4DX8Io95/00cn1+g+UNOpEaFyTKYetX2RtRN+pRoP2UUL4dbrUqKx7/7hxnu
         ldjQx3/b1MMb0lc9BU0LAMnN/AmXspfgPlOEcYd5GI77yp5+dFkKsHiWN0a5x8jbAnpQ
         ZB90Y35hobub4tRPNfFJ5NovPYMU9XxY4BgdgPyR97OdHOu3MXdGMjzCiZQgnLieQ15/
         2JNi3fNjYi7unYb8tCC4tcCTg1gSzsu0EWuils5jhj9T/0UJy/nM2rP+f86K9oHSm4uO
         uTqw==
X-Gm-Message-State: AOJu0YylXay+unspjCzKb2XEAxLguSN9evvoV2D/Zyh7tMDxYM75JIXb
	Bo8BOUesCQgDh1EAYgU/GKoJSc67LqR6OBCxXfbj+w==
X-Google-Smtp-Source: AGHT+IFfihGghZxaOx77OzFwyUrNBsA7BsHF9OMXxQ7gHC+wgag1CBz+lqHxb3KAAncOcs9MZLh4dPqNFCqaz/EyQf8=
X-Received: by 2002:a67:c392:0:b0:457:cd5d:6ab5 with SMTP id
 s18-20020a67c392000000b00457cd5d6ab5mr12205839vsj.23.1698748584165; Tue, 31
 Oct 2023 03:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031100742.98859-1-sumit.garg@linaro.org> <0de17ec7-b692-4d1e-b059-c5f3f619e94a@oracle.com>
In-Reply-To: <0de17ec7-b692-4d1e-b059-c5f3f619e94a@oracle.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 31 Oct 2023 16:06:13 +0530
Message-ID: <CAFA6WYPC83ZOocdUo0V=RfG5RQZosqK0jHdELPP3M2bFNGYJYQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Destage TEE subsystem documentation
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: corbet@lwn.net, jens.wiklander@linaro.org, Rijo-john.Thomas@amd.com, 
	balint.dobszay@arm.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"

Hi Vegard,

Thanks for your feedback.

On Tue, 31 Oct 2023 at 15:46, Vegard Nossum <vegard.nossum@oracle.com> wrote:
>
>
> On 31/10/2023 11:07, Sumit Garg wrote:
> > Add a separate documentation directory for TEE subsystem since it is a
> > standalone subsystem which already offers devices consumed by multiple
> > different subsystem drivers.
> >
> > Split overall TEE subsystem documentation modularly where the first
> > module covers the overview of TEE subsystem itself along with generic
> > features. Then the further modules are dedicated to different TEE
> > implementations like:
> > - OP-TEE
> > - AMD-TEE
> > - and so on for future TEE implementation support.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >   Documentation/staging/index.rst  |   1 -
> >   Documentation/staging/tee.rst    | 364 -------------------------------
> >   Documentation/subsystem-apis.rst |   1 +
> >   Documentation/tee/amd-tee.rst    |  90 ++++++++
> >   Documentation/tee/index.rst      |  19 ++
> >   Documentation/tee/op-tee.rst     | 166 ++++++++++++++
> >   Documentation/tee/tee.rst        | 122 +++++++++++
> >   MAINTAINERS                      |   2 +-
> >   8 files changed, 399 insertions(+), 366 deletions(-)
> >   delete mode 100644 Documentation/staging/tee.rst
> >   create mode 100644 Documentation/tee/amd-tee.rst
> >   create mode 100644 Documentation/tee/index.rst
> >   create mode 100644 Documentation/tee/op-tee.rst
> >   create mode 100644 Documentation/tee/tee.rst
>
> A comment from the peanut gallery:
>
> The old tee.rst starts out describing the userspace API (include/uapi/,
> /dev/tee, etc.). Maybe this part should go into
> Documentation/userspace-api/.
>
> The rest of the document describes the internal kernel API (how to write
> a TEE driver). And maybe this part should go into Documentation/driver-api/.
>
> At least I think that kind of split is what the documentation is going
> for in the long term, so if you're moving these files around anyway it
> might make sense to do it right away.
>

It makes perfect sense. I will do that for v2 but let me wait for any
further feedback on v1.

-Sumit

>
> Vegard
