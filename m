Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B366D22D782
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748617180; cv=none; b=orxB0dQ/d+WpaNNMTFQ/E6+XxV430Qz6XL4E+OsTz/yYVC7LiV8CPTgR2LmjLkH43c4bt7rY39IAHt3Gnekq+Hw73sDv7VGDTBzUgiQcbUQ1gM4+5aUZhKIKLNd986qWYTC0pk7sxy5N2XkCw5kVnYK9lfBLrVZyJFiPHEE1zDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748617180; c=relaxed/simple;
	bh=jasKmp2aQuprGgWI5wC0BqX8f7HQURC6vV2wipWoXUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ry0obpkdwP+ksV8++s8EJoa86bCEi1Z/jCOipEXWWHdqwkH0rS54P1YlzsOAaKplNV34PLw8CAYPcRJ4Zh7zOcX49M7TDkmyYYlvaxCt/LirQgLCapPIwta3vE5cbgzp4u7e227PD2NiV+kjRJdqgAWaBZ0RxZ8YFk10CY4UZmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZKbzoavf; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZKbzoavf"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e302191a3so18749677b3.2
        for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 07:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1748617177; x=1749221977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAAu3PNn/g5swmaHMNzxUtR7zHSWqNSkf/EYcL84FJM=;
        b=ZKbzoavfJTTsa1cyffhW4nXl/B2WC9layXNA/Xwo4HB1mjXpmYbPZnxWkFNlisELmd
         jAeyAgL9mMb7qJbVHJOUBWT7WsY/P8iJiU447v9jhfjs8clOJCQFPqIz5p+tUUaRg4QQ
         pqa/2gHJnE6jlOO/7+SiXrX0Tzaq/qm8opI2itTNMgTnTztfNWYxQLoqoUO24cHElzhr
         PX2UL8PcTbab76f871N6wVhxRyhIyMMaGe4VjQhDAln3ez+tuvmXMeuKK4kOIuyQWpA3
         8vYI2H81GIXnusEcRhT/wb+GCs17fB1zPeyPi5Zwwor0ddJFGOvho48cupfENEED+BIr
         a1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748617177; x=1749221977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAAu3PNn/g5swmaHMNzxUtR7zHSWqNSkf/EYcL84FJM=;
        b=akGCnM4I1x75X4F8SJT0zN0Ad3j5tvWZCP1i5Ztk8/sCNnm4rJTJRCdA23BxlyF3hn
         Qh7TmCzYIkd7UPKynFOOxPzH5z7jpiuPWaErb1l8FM9yjtgCrLemvY+c2kDLzKPTpqSr
         F9I5bHeQob6K1pzD9i5dlscdg1V6onz2YV3QM71l3GuWS8FtT9ytyLCw0h7I5CsIQCcy
         6VayW55N6Wjp0jluCqPdME76iYMeQujMvXWj27DBgo0O8nm/ulG33cKdhAZ8q5WCtWmC
         E7RyZXJJeboD7HxbA+E6oUwjJ7Ld/qh5UqeFa27JiU6pP6hHcg1ppQlAbrAusEhzA7cT
         MSCw==
X-Forwarded-Encrypted: i=1; AJvYcCWO+87IqVfG9u+ESAyXcnTH0O4y85vNDiLnPM/F8hvHojmwJEe5VVz1j7nyAojoTmZIgKNemw9DC3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsC9fnkHX4a/W9xvAXIXKewDuAhKDLViSv493ehQwB50etJviE
	7Yq1KzQE/VkO5IFfKJW39FMbjmkdhH5OP2y7xCc6ZlBrm87fOnHlhIQczd7ERkgdJGgSnuKmq6D
	wbEzQ35wa3n8R66RqlMDfrGP+9PREtIp3GvATrxRd
X-Gm-Gg: ASbGnctWc5X5Fj1KtXUgS7/pe8ntjUfUnFBGniyqU0CqisZ2tIjFrzvhc/kzs19VQy3
	Q9sNX0/gA1mvN06W5XvMq+TeIxqC484dcVb3eFLEmwZgyfvNt3p5Ty1ELLHxjSRdq7B2PsU2IWZ
	LtyLHFbS1gHqOVV7zd1zfdT+rtg0jRxRxoKhtbdHgpVu8=
X-Google-Smtp-Source: AGHT+IHHnVePMsvh3ufc14xyANHYkK76dmtQi3C9pr0hEAJFnSpRDvuBz9Sw+cjnx2wg+DaroEvhGoRJ1j6utE6EWUc=
X-Received: by 2002:a05:690c:c0b:b0:70e:2a04:c768 with SMTP id
 00721157ae682-70f97e9b96cmr52596327b3.14.1748617177588; Fri, 30 May 2025
 07:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521140121.591482-1-git@nightmared.fr> <20250521140121.591482-10-git@nightmared.fr>
 <CAHC9VhR-80zxgo+q07Aw8HqK+qiPdnuXC0axONGac0e9JxXvmw@mail.gmail.com>
 <4939d8ab-3911-4759-b8d6-cb57ff9f9cda@nightmared.fr> <CAHC9VhT5JrhzGhRnJ4VNo6e941o-xdAG-FC-Q6wDbSZhgSUWOQ@mail.gmail.com>
 <2495c0bf-5a24-483b-835f-abf433687889@nightmared.fr>
In-Reply-To: <2495c0bf-5a24-483b-835f-abf433687889@nightmared.fr>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 30 May 2025 10:59:26 -0400
X-Gm-Features: AX0GCFvKjrCn57dBCtHrgxUd83Gfghrq1tsQqynYBLqWk4EKe074m06s3Cas29k
Message-ID: <CAHC9VhSvwOZXnh4o3O8_+QXXKJ32D=9ogoizvNzEEGpzQWhx+A@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] Loadpol LSM: add a minimal documentation
To: Simon Thoby <git@nightmared.fr>, Kees Cook <kees@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 3:03=E2=80=AFAM Simon Thoby <git@nightmared.fr> wro=
te:
> On 5/30/25 01:49, Paul Moore wrote:
> >
> > My thinking around possible augmentation of LoadPin is that both
> > LoadPin and Loadpol share a similar, limited focus of controlling
> > access to kernel module loading and Loadpol has support for a basic
> > loadable policy, a policy that could likely be extended to support a
> > LoadPin-esque construct that limit module loading based on filesystem
> > pinning.  It probably makes more sense to think of adding LoadPin
> > support to Loadpol, rather than augmenting LoadPin to support the
> > Loadpol concepts, but for consistency with upstream we probably need
> > to speak in terms of the latter.
>
> Thanks for the reply, I now see what you meant. I will try to put somethi=
ng
> together (hopefully next week), starting with looking at how we can expre=
ss
> the current LoadPin feature set as a loadable and user-extensible policy,=
 and
> then add non-filesystem-related policy entries (like module name restrict=
ions)
> to that policy.

You may want to see what Kees thinks of the idea before you spend too
much time on this as he is the LoadPin maintainer.  I'm guessing he
would be okay with the additions, but that is just a guess on my part.

--=20
paul-moore.com
