Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C1E4E2361
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 12:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561100; cv=none; b=A45Wxg5X7RxThcVTF4zbUAGt4RxRHoCvId91s8jXC14rUKZ+t318EY60aQncaemmU+L99UxkNPbHlDk/8+JSpyJwNAZkwNR+k14PH6PQ8WNQMsHGVMFl8mf6CUr6lIGPf4M1/l+u+I+jwhpzZVPpssqyrg2gco1T+qsI6X8xhh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561100; c=relaxed/simple;
	bh=5WFjVUuobuPQxAFoCziWaPOaSMkBfc9ecA27/iiHUzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dj0SH68OB2X6a3ZC0ji2TxvmP+nXjpciYH2bOqOE3FiyJmH8zHPcqKj99j8EkhSYEDz+8CBQwW2EfSGufj6Hj/DetDkqCVyw6mXBbpZIZxYa0fvliM68H3K7xKdvR2XNNXubZLdN13d0u9rZqriVb9q9zTvk46efT07Vqdf/JYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=camzooUc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="camzooUc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so10929165e9.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 05:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789561096; x=1790165896; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+ts77r74LmMvSBcklE9DvUY6/Ijk6SNBQqauJ/Ja6A=;
        b=camzooUcQnyAFNJOloPBCfg31XuRKft0cZfmlXWpBAgRunnURBOzvfjvmPInCWFV9k
         tJMQ9CjG5yufVo0EHOQbdioOqbTNWXm6Vdzk34ltno0l2AAfdfbKlMmbWFXyV4WQFy02
         zBPn3qttncXxwZalIHbHrZfWFtwKyCRySbiaEVGe9ey5ofdR7e/YYKEx5O68i9KDM8kT
         m333XnLqUitJGSECnpv3EA/eUvCvYRkK7F9NVncT6uUncBJO6rhKs1xtejz9JiQBeQ6e
         KWdA845LqQRK7LkemYhVPf/k+MngzcdgEhO+3GU/DFS0y5FvWtcy0k1I4820kz8DH9kV
         wOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561096; x=1790165896;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q+ts77r74LmMvSBcklE9DvUY6/Ijk6SNBQqauJ/Ja6A=;
        b=eCRi3VU+ioQipJW+7ZqxlSXe76jeHWno1nSYg+l8Ym9snOi33o1Qroh67p+WNdbBOS
         csQwSCqcQv0gyI9V/FikeTh/07+oNB34fpYCAJDa3WX+P7SgTdFeTCn9SJ4BlJQQ2Owo
         diNAhmRx7jv2Y+xgT4t4Ad9unS9SktgXwkERoOUIp7FznJZUdOrtpDDwG+Iq4UYFB/ow
         1g7bb/k6LLOdQn0bNGe+4/I+rGaLRBTBR/nTmV1kU+K834CNzLhwW1OdK6YxVswVV8gl
         LO3YqSDI1hYXPtSKkr+T3x/IOvPfY1ECYjjnIyoB46AZzZVVRR614rBZMbeg/PhnVjic
         uKEw==
X-Forwarded-Encrypted: i=1; AKwUvBwW57pmB8SU6Ah6MTZ0KVgS00uOQ0+bbFc0PNt4Ln3SXJmim/MfSzSZM/G5dsxEz9A+llj4OwuJB6s=@vger.kernel.org
X-Gm-Message-State: AFuF++klkVc342xTca58So3l+bi0mitLYaNcIsZRYFvAks6aQtKf8Rte
	LwIXm1S+7AYlJcX1D14qvjZG8XuVqhx+5fJzh6n96SE/065GXffUTegLKCGdU5al0JQ8tNBJrBm
	AQnChVnD+
X-Gm-Gg: AYBFou1z6R1FRI/Bm6hnHrrLfUxAnZGkZoIidD2mLmUJGYylpOFw+wdASyNWzi3ms0L
	R8AusN5jWKMAJycRZky0dP+WhnvoDYtXQWnhuMgZikxiWPIk9HRkwk4gNgkB1rSBP2abvKVrbt+
	fuT2fda7ikvy7PH1ZyM8gShe0xeF55Js//4Z8m5safxWEh25yj89FY06Xywe/Ro4y73jpiZxgZ7
	sFTXIhT9LznMTO/XRFRLzJKrPz1JaRx7NweQy1nJ59s575go8X0kLcrKuw75bVUqJ5k7eyqddB5
	SPm8asMbw+JsefOneNEEZQ/lSnU4HQdPPQ/peQWpCy3D/Q3t6vLh3MNHNpRr3Sd6t/PNCNqVlmU
	aIVlFxSdfBZ0YuvpJ3OJRF224AJH0yQe3gu9ppEypfL8F2Bp5IGMqo+wKL/rrJ1TJdwE10/qng1
	2vnnD3/rOnMK6+QmZhFFa6B5fRTnY14dEC2NRXVe+/R0fJWjUBxa806NJMErjMJqg/F4Hl651dK
	N0EWIwUMbiFtn87SyRuzq3vXylAPaEvrnTjpcVA
X-Received: by 2002:a05:600c:3b09:b0:49e:6fd2:a45 with SMTP id 5b1f17b1804b1-49eb73477famr28445955e9.16.1789561095701;
        Wed, 16 Sep 2026 05:18:15 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:a430:d4f:f001:4a5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83da071asm92376395e9.8.2026.09.16.05.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:18:14 -0700 (PDT)
Date: Wed, 16 Sep 2026 14:18:09 +0200
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: Christopher Lusk <clusk@northecho.dev>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: landlock: clarify TTY signal scoping
Message-ID: <aqqJAZfG9FC7PgMW@google.com>
References: <20260914.b8a029f9abb8@gnoack.org>
 <20260914180946.1462099-1-clusk@northecho.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914180946.1462099-1-clusk@northecho.dev>

Hello!

Thanks for the review!

On Mon, Sep 14, 2026 at 02:09:46PM -0400, Christopher Lusk wrote:
> LANDLOCK_SCOPE_SIGNAL mediates signal delivery when a sandboxed process
> selects the recipient, including SIGIO through fowner.  It does not mediate
> signals directed by the TTY layer to processes attached to a terminal in
> response to terminal activity.  This distinction was clarified while
> discussing TIOCSIG handling because the PTY master acts as a capability and
> the signal recipients have attached to the terminal.
> 
> Document the TTY-driven signal paths which are outside the scope and advise
> controlling access to the terminal or PTY master instead.  This records the
> outcome of the RFC discussion and avoids implying that
> LANDLOCK_SCOPE_SIGNAL covers every signal-delivery mechanism.
> 
> The documentation text and changelog were drafted with assistance from
> Claude (claude-opus-4-8) and Codex (gpt-5.6-sol).
> 
> The userspace API documentation builds successfully with the kernel-pinned
> Sphinx dependencies.  The remaining warnings are unrelated to the changed
> Landlock text.
> 
> Link: https://lore.kernel.org/r/20260914.b8a029f9abb8@gnoack.org
> Suggested-by: Günther Noack <gnoack@google.com>
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Christopher Lusk <clusk@northecho.dev>
> ---
>  Documentation/userspace-api/landlock.rst | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
> index 84cb7bf6b3ed..64418b09840d 100644
> --- a/Documentation/userspace-api/landlock.rst
> +++ b/Documentation/userspace-api/landlock.rst
> @@ -430,6 +430,21 @@ The operations which can be scoped are:
>      This limits the sending of signals to target processes which run within the
>      same or a nested Landlock domain.
>  
> +    This scope does not cover signals delivered by the TTY layer.  A process
> +    holding a PTY master, or otherwise driving a terminal, can cause the TTY
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What other ways of driving a terminal are you alluding to?  (I assume
the LLM wrote that?  Did it make that up, or does it have another trick
up its sleeve for sending signals that we are overlooking?)


> +    driver to deliver signals to processes attached to that terminal across
> +    Landlock domain boundaries.  This includes ``SIGINT``, ``SIGQUIT``, and
> +    ``SIGTSTP`` via the ``TIOCSIG`` :manpage:`ioctl(2)` command or the
> +    corresponding control characters.  The TTY layer may also deliver
> +    ``SIGWINCH``, ``SIGHUP``, and ``SIGCONT``.
> +
> +    These signals originate from the TTY driver in response to terminal
> +    activity rather than from a :manpage:`kill(2)`-style request.  They can
> +    only reach processes attached to the terminal.  To restrict this
> +    interaction, control possession of the PTY master and terminal attachment.
> +    For example, do not pass a PTY master to a sandboxed process if its slave
> +    has processes from outside the Landlock domain attached to it.
> +

LANDLOCK_SCOPE_SIGNAL was previously described in two lines here.
Now we have 15 lines, 13 of which are talking exclusively about the PTY corner
case.  I am afraid this will water down the main message here.

I understand that LLMs can help in writing good English, but they also
have a tendency to be much more verbose than the existing text and can
direct the reader's attention away from the main points with that.

Suggested replacement:

  Holding a PTY master FD still grants the capability to issue signals
  through that PTY to the processes running under that terminal.

Does that seem reasonable?

Listing the full list of signals that can be sent through a PTY seems like an
excessive level of detail here.  But if you find a reference listing
the same signals in kernel doc or a stable URL, we could link it from
the docs.


Please also add an (even shorter) remark to the landlock.h header
file's description of LANDLOCK_SCOPE_SIGNAL, similar in length to the
one we added for the whiteout objects for LANDLOCK_ACCESS_FS_MAKE_REG
recently.

>  ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET``
>      This limits the set of abstract :manpage:`unix(7)` sockets to which we can
>      :manpage:`connect(2)` to socket addresses which were created by a process in
> -- 
> 2.55.0
> 

Some meta-level remarks:

* Please send new patch sets as top-level emails rather than as
  responses to existing mail threads.  (It is not technically wrong to
  do that, but they do get overlooked within mail threads more often.
  To connect the dots, you can link the original mail on lore as
  you've already done here as well.)

* *If you want*, a thing that would still be worthwhile having in code
  would be a regression selftest for this signal sending path.  This
  is similar to the tests you've already created in your initial
  patchset, but would now check that signal sending *works* despite
  the sender being in the scoped domain.

(For transparency, I should remark that the final decision on this
code review is still up to Mickaël in the end.  I do believe that this
approach is the best solution, but the reasoning is less clear-cut
than in other bugs we had before.)

Thanks,
—Günther
