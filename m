Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB576034
	for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718966065; cv=none; b=sm1OhLxkMcMmM5RoSPTUoJSX8MELP9rMmFbARRiuYKdbnyadnkTGHZF7bWu5Pg6L18bo1syUovn9GuyIIXcmzYgB1leMWF4zKKBs/SWgXgBCS0Y1MyyzEnAJxrkKv4OvGR1CK9BRHOpgzx3mOMXTspCCmFuHOTUvEJxvnkWoK5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718966065; c=relaxed/simple;
	bh=SSeHh9kklPfPOkBvM8SO62iwOdE98d/i16mJy6LV0A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMP0fiMpFq5mi7s+88tys94IGxZVpi06oFLMTzPHP1309J3BQ+BVRnHSvljWZDJZC1cM7N9qXuuxKChlXaPXe28Lq0vp3LAXsSTfq5HUz/d7spI/Nc5E7qviyU/llnxAhMoud2pYEkApvbT21uh8BP1Rm2rOqY0LBCZADuRc1W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jAXMQVV+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jAXMQVV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718966062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jicH10kgnAem7iqh38i51ASJS4+fEuc9yNE84SfuDqU=;
	b=jAXMQVV+07xtGzte3T6SahzIgHp/u80zc9dnq909lVOy3IjWitZbwWITvAud4djt5r6dSu
	pnAsQ9q92Hi6wtatBQIAjFov2lTodyrM5hD1zMofli56jrzDJoR3uEkLSGpk8Xfebv+w7t
	VlKthkLQPhc+XMBz4/V/LxRKSHwmnjk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-bqHFnCw1O-CEOOG9MZq7CQ-1; Fri, 21 Jun 2024 06:34:20 -0400
X-MC-Unique: bqHFnCw1O-CEOOG9MZq7CQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-57c93227bbeso1076801a12.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 03:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966060; x=1719570860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jicH10kgnAem7iqh38i51ASJS4+fEuc9yNE84SfuDqU=;
        b=ZLwZy+fyhj+yGfBeEBOrvtvpwjykAItxs115/g8bxqsxQOud+k1UKohUkQKcYE5moF
         njNI+1XNJ3OApXgn5q4JuIKzDvqCNIS++cQIqbLc6yQUQm1qShy70b1YE223kjkilICy
         J2pPayaOy8auoFofKwinzyYTj8JUKVKdL6twOjilXL11OsWwCXefTXlK3IhUKOSoPqgA
         xXHg3C9g7cGyJYRHqRJxsIU/q7ob0xjnQlv1Tc+lcZUWR2vZLnGycGU5qVoPRv7wt2iF
         lLwIP1ih0FPkpkuL1oKKZ79BeJOmCHWmx0zPm1pAongJLVgay+4E5hKNQdp0zc3pEbQu
         wk3g==
X-Forwarded-Encrypted: i=1; AJvYcCXA80lgWrDq4Q/tcTtg0funChYeKXKOOiCRU7lLvDTZkVL4QnYDHs/l0EWaPFXGjq/+/TAdXER72Y6dTwBbjtE/o8s+GS/pp5u0
X-Gm-Message-State: AOJu0YyoGeYIAK3LCnUFQ6biQvuDf2nPKher/8dLFk7gSNJIIstE8Oof
	8Ee2vjUSX62nLl8bvhUvT6Hk5YQPQ3TjTflng2TBq29mRltAz2XKF0MjkR2B7zRAOBkAq4HJ9Ne
	xlHwSQJ9OhS304q2KvY+FDe5d0MCPhMBN1bEG7HIQBGJQkgMam+a3dFEqeg==
X-Received: by 2002:a50:ab52:0:b0:57d:50e:d76b with SMTP id 4fb4d7f45d1cf-57d07e2c81amr4589280a12.7.1718966059592;
        Fri, 21 Jun 2024 03:34:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj+LHC14k3j9hWJnw+AA9J/VaHS6CBPN7VDxZhc4wOnEY9CizAlhrLs2CdLC8RK9nzYWVisQ==
X-Received: by 2002:a50:ab52:0:b0:57d:50e:d76b with SMTP id 4fb4d7f45d1cf-57d07e2c81amr4589250a12.7.1718966058632;
        Fri, 21 Jun 2024 03:34:18 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30562ee6sm747252a12.87.2024.06.21.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:34:18 -0700 (PDT)
Date: Fri, 21 Jun 2024 06:34:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH v2 2/2] Documentation: best practices for using Link
 trailers
Message-ID: <20240621062741-mutt-send-email-mst@kernel.org>
References: <20240619-docs-patch-msgid-link-v2-0-72dd272bfe37@linuxfoundation.org>
 <20240619-docs-patch-msgid-link-v2-2-72dd272bfe37@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-docs-patch-msgid-link-v2-2-72dd272bfe37@linuxfoundation.org>

On Wed, Jun 19, 2024 at 02:24:07PM -0400, Konstantin Ryabitsev wrote:
> Based on multiple conversations, most recently on the ksummit mailing
> list [1], add some best practices for using the Link trailer, such as:
> 
> - how to use markdown-like bracketed numbers in the commit message to
> indicate the corresponding link
> - when to use lore.kernel.org vs patch.msgid.link domains
> 
> Cc: ksummit@lists.linux.dev
> Link: https://lore.kernel.org/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # [1]
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> ---
>  Documentation/process/maintainer-tip.rst | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/process/maintainer-tip.rst b/Documentation/process/maintainer-tip.rst
> index 64739968afa6..ba312345d030 100644
> --- a/Documentation/process/maintainer-tip.rst
> +++ b/Documentation/process/maintainer-tip.rst
> @@ -372,17 +372,31 @@ following tag ordering scheme:
>  
>   - Link: ``https://link/to/information``
>  
> -   For referring to an email on LKML or other kernel mailing lists,
> -   please use the lore.kernel.org redirector URL::
> +   For referring to an email posted to the kernel mailing lists, please
> +   use the lore.kernel.org redirector URL::
>  
> -     https://lore.kernel.org/r/email-message@id
> +     Link: https://lore.kernel.org/email-message-id@here
>  
> -   The kernel.org redirector is considered a stable URL, unlike other email
> -   archives.
> +   This URL should be used when referring to relevant mailing list
> +   topics, related patch sets, or other notable discussion threads.
> +   A convenient way to associate ``Link:`` trailers with the commit
> +   message is to use markdown-like bracketed notation, for example::
>  
> -   Maintainers will add a Link tag referencing the email of the patch
> -   submission when they apply a patch to the tip tree. This tag is useful
> -   for later reference and is also used for commit notifications.
> +     A similar approach was attempted before as part of a different
> +     effort [1], but the initial implementation caused too many
> +     regressions [2], so it was backed out and reimplemented.
> +
> +     Link: https://lore.kernel.org/some-msgid@here # [1]
> +     Link: https://bugzilla.example.org/bug/12345  # [2]
> +
> +   You can also use ``Link:`` trailers to indicate the origin of the
> +   patch when applying it to your git tree. In that case, please use the
> +   dedicated ``patch.msgid.link`` domain instead of ``lore.kernel.org``.
> +   This practice makes it possible for automated tooling to identify
> +   which link to use to retrieve the original patch submission. For
> +   example::
> +
> +     Link: https://patch.msgid.link/patch-source-message-id@here
>  
>  Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
>  they just complicate automated extraction of tags.

Could you please add a hint on configuring git am to create these?

I think something like this in .git/hooks/applypatch-msg will work:

. git-sh-setup
perl -pi -e 's|^Message-Id:\s*<?([^>]+)>?$|Link: https://patch.msgid.link/$1|g;' "$1"
test -x "$GIT_DIR/hooks/commit-msg" &&
        exec "$GIT_DIR/hooks/commit-msg" ${1+"$@"}
:

but I didn't actually try.

Thanks!

> -- 
> 2.45.2
> 

