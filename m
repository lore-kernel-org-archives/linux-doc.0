Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4F74457A4
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456455; cv=none; b=OSUIqlx3+iii8D40aq5B6p1/WPkKqIth6WTpeeUYAr2dSo9JkgO+iBdSSCuHXGw9zqgNvShS7NHMZPAdJjhwbEBaf1daY1wcX7UnyY0lilUzOfwWjlxsAqm8dANZwFD/kgq4JQlMefxJtZYeHwLjCMwws+7mY2RTIbQyQPHZYcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456455; c=relaxed/simple;
	bh=NzyHlj+F1WnazB4+oa+9hqNquIJnPs2apGJceu268FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdtcB8SGoHSrjk3qxe9Lu0fom+doU4XoswmGt68yyZI9HOwqKo/Ufa/rjKwlackOrgou+ve9MkZcwisUOSqTnGZiyloW6YS+7Ul2+JGomRVrqZZsQr+iTCxSJ0Bn3EPvJmfRf+pU8SsypR9mPrProKdJjBd7IpIwQGJsIAJ9zXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1sShHkt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1sShHkt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6901F00ACF
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 17:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788456452;
	bh=NzyHlj+F1WnazB4+oa+9hqNquIJnPs2apGJceu268FA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P1sShHktbqhsfw0j4yS7W94i3+Z5MRKBa+5D521CJePm3D4TRKWHXYoDwXJQdLnBr
	 scrSJr8cEYnn52WBoh9kSFo6KGaX8zgiBJUjOk3WI1CCZ5tHvpdyyIBaUJnG08vmDH
	 kAlplH5liFKaOJSOS3wt9B/8Ni/DM8QKrEpxKyHGs2BnXrdDSbn/gEBZfl2gCc48j+
	 Lxz6BigoGEyHDvXUdQeqagEEgk9FFYtpdIumaC3pWxHHwBYG+kVQ2KdmtkA59pGF8H
	 Bxlqh2/a4dIiNv/3gSVbz/JxX4ej3i99lOL3fjo429Qqpkq66DSXU9Yn3yhqYj91IS
	 xE5wMSP99sMNQ==
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e041ea211so44757a91.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2026 10:27:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy4zAuKKrJKFdtlRTfYYFmB+hzKXQ2pxDnF+wFF6zQg2/c1BjlEaqpXAP8jDy9y0qtdIM12PdPGcb0=@vger.kernel.org
X-Gm-Message-State: AFuF++mgy0p7IsvBzLvTvhFG/VxkNpsZkQwtYFN7eBDQeUkPQ44LXQxF
	iPaYYn3Vl6vAcqnwT6SUddtslmMGsljhPuReLKFgztj3XoJSbrlu1CKCwMjsrHw8bPjf6C2iGaT
	ahOhyYyMUbwG5/ccSHZJs9tQ0st+ldC8=
X-Received: by 2002:a17:90b:5310:b0:381:11eb:d78e with SMTP id
 98e67ed59e1d1-39b26272b59mr4877a91.14.1788456451651; Thu, 03 Sep 2026
 10:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902152910.708743-3-manuelebnerli@mailbox.org> <a4f81c75-bd83-499d-9dc7-b891ec9cd922@infradead.org>
In-Reply-To: <a4f81c75-bd83-499d-9dc7-b891ec9cd922@infradead.org>
From: Fan Wu <wufan@kernel.org>
Date: Thu, 3 Sep 2026 10:27:19 -0700
X-Gmail-Original-Message-ID: <CAKtyLkGDab8y4gLCxB8it0R7pJEYk6SF2YDRuhxGwRnoPJCVsw@mail.gmail.com>
X-Gm-Features: AcwNN1UzhA_lKFHBKz39dW7UfnttRnAH9rsChsJlzbrbWgm9FM8-99pn-OxwtcM
Message-ID: <CAKtyLkGDab8y4gLCxB8it0R7pJEYk6SF2YDRuhxGwRnoPJCVsw@mail.gmail.com>
Subject: Re: [PATCH v3] ipe: fix invalid sgid value in audit event documentation
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Fan Wu <wufan@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Deven Bowers <deven.desai@linux.microsoft.com>, Paul Moore <paul@paul-moore.com>, 
	Manuel Ebner <manuelebner@mailbox.org>, Fan Wu <wufan@linux.microsoft.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:21=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 9/2/26 8:29 AM, Manuel Ebner wrote:
> > From: Manuel Ebner <manuelebner@mailbox.org>
> >
> > The audit event example in the IPE documentation contains 'sgid=3D)',
> > which is not a valid Set Group ID value. Fix it to use 'sgid=3D0'.
> >
> > Fixes: ac6731870ed9 ("documentation: add IPE documentation")
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Thanks.
>

It's now in ipe/next.

-Fan
