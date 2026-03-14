Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D630282F0A
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773520667; cv=pass; b=set89JHkbUeb+wTyQ/qP2Qw1p3F1VsMxTNlFOC/lhWzmhpe1MaYbRs6Lhz0bCJnOHCA1jzFa9wkWTVUgRuDNZCPpY5JVib/D37l5UmzyWWMeJ7KRyMhCPNVp+vFzixeV/DSyLDEZqPemKnLcsaqac7ioCueyTm2cdOj6r8IThTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773520667; c=relaxed/simple;
	bh=8GTE/blz0VrDdAxWEEsdMAInvVw+uu6EWObydas06DM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5Brjhn3TiRzWSJ+L98PPLDd6x64dc2qhwZBZc7jA/C3Ub4V5hqqQOTByytBh4od8ujR4+4yTmZgSQk1YclMAxvHE+NqGZQ//OYPLwVaGTUCCJ7nOv1Ts27f0tLSqgfdLi5+HUTx5wl+Qz4bMhXNnLNVL5PnBpIdaP8ofFshGWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgkNZzcz; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgkNZzcz"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ca6595c8aso3126302d50.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 13:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773520665; cv=none;
        d=google.com; s=arc-20240605;
        b=j4ERYsjL0H9MUD0lKU777016c4a/Vs2r/1GUztpPu+SCYS2z9jTyPoF+zw+T6pbIvh
         ms/g5BoLokiJV9ihOE+tdTa7Nr3FcJEN728sXqm0Y8gueOgtBGVcJm23i8s5DNunG5bk
         4bxidXhZ25wWV3Tonthz9KGF4lAGZnfd9JzFZr1hRwSD+atpnm7m3ZD+J4nrh3iVfzzi
         bIiqd+IDL7DAyeYaayVScAWD1qKotuf3S6fltexGhb8z9LKCe9kXDwdUofn8qiB2tYiX
         HZXCiwEynwBaVjoQm8pLsMsce06N8PzdsUZ3ylixHq1VZvU5NEuumyOz3MQLfZTXnM8k
         2IgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bw/8E5PGkwuGEntQ14lqvKmLyctBPAI8FASKsqUgF90=;
        fh=RoC6KkAvEk3125+WrHVcFcLxc89NfQGPw2st3rcn+xE=;
        b=RDwLLvijlEOnIDajBl2mi+ROs1h3hJd1arvOEZMufLcnOKmdniduEGuwyJCSglMPYF
         ix3K3jDq/WaEnmQKswcgaqpDrt0jCqBIVySvLkgSuSFhEpjvHasqXHcFKFlublGTwg48
         q+mJ1a1wZT12wpnFJn6F7IBMr2S2rirU031qxZ3Wpcx5sXT9vi7jsIBlbllGcKQnh8iF
         Vlg6x2xWki825w4NOtdEVUdjiHn4Y4vDVb1zcnrcJaveg9vy9s+/dydTJkUsGI0iw6Lw
         H6kzkezUhJjnShLMuQz3DAN47vMoh+39leyP5UZ8He637lAZzjrwPe00xE1tFtaSLDlU
         lYjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773520665; x=1774125465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bw/8E5PGkwuGEntQ14lqvKmLyctBPAI8FASKsqUgF90=;
        b=QgkNZzczyKzZUNMsRwWWT9RuGr2ytNgFOZwlOMg51QDlmfXXiJprII0bajv1wq1xEf
         cj4EFjKDVbcCcLNhv9hqWNhp+Ti/v+0hmyPwd+AP9bJlpywGy04VMEwp90AO4URE99I5
         6gKiMnWCMEQljIy3835W5ilwSYCATnB5b5HoEc8+UgMaUQDBUlLLZb7J+wbA4P8GVDVJ
         SrUbSiGWh6BewuF2TH6TEFKk4CmyCXXoAS73rugHGtO9YDteZR3JT/GeNVp5uzYSUtLy
         gc4qfwUgitj3Nn6mQNw+/n6nor1A1r/vkaETBTUk11JIvVIS11gubIsp5zoEdYXsjUlN
         JKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773520665; x=1774125465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bw/8E5PGkwuGEntQ14lqvKmLyctBPAI8FASKsqUgF90=;
        b=hdKRsttBtd73pWzdWS44EQFV22ixfQW4DiwwBQo9u+F4S2hBZdf4VJ/Z7S/EKp57Mv
         R3F4mLL76VOUcuBl2hs55FiRC2IGFVQJLTcjryQPgsfosvltSISx80mrwBo/oMVkfYOT
         HPjQS1MtpWOD+NDvuo3iu1q4H1uTFnhsw4SFfBoyTDXYVzig0z0//+U+eZci2O7os3kq
         pHhC3/u6lcSZYQcJ5rAchf2rWps9be5Etfm+8y7hhS+4A/HTUctieuLxxXvIkkmRhi2c
         X9pDu1Uz9lMtoIuXtslnBsjswYj0hLaZNH7I0QeR8AzHm5ywfoGbbH/X7jWbBZ7tOvAO
         vRGA==
X-Forwarded-Encrypted: i=1; AJvYcCVYn+zu2FRAoDtsNzO/ffMFhTGEh2jHreqFxZCbR4AjAh3q0QVQk+k+C0HfNRnSwg3cptuTB9chSjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxihXbpIJYuHJp5clW9Hi2b7VkoZAJbMbaOlYsBv4LYkhOAbdLe
	8yaSdMAKCJHxZiCfzOMQHq5OjjsE90KO5qdr9xjpe3uT9ctkkzXEEDI7w1XasdISsOPCHs6UltB
	moCHD+oeneZqsv6uOIbdic3P6w3hgcllh3QTnzkA=
X-Gm-Gg: ATEYQzyuVC/qOi64gwKffaJJ5GsU3knvjD2AXagPMY6zNRrZg+YlT8vDYYLv9VkV5HP
	SKo7e8ZybbtZ8xAHCZADqItIbGneHVC4f4ecG+F3dJKNkUQO7zlc6BpC5fLYaWglP2m2TR/m+Bf
	G5z0oT043l1pzCoAhy4Jta4YS5OBI5qTD+nzDm13e89mgLQ+RMmfqJ2rNvabAyu5EMemE3UHrzh
	q08EdNyO7RfuJuVk4zNxABn97U2phBsJaeNzCqJCfU4N882dfl1e4IcV5h0mKfq03u5fp+F3gTM
	sgoUlQZ+GEkYmkPkXyuzfmJICT9qHBBPsmnZlp23Ntb4iSg6e3k=
X-Received: by 2002:a05:690e:4402:b0:64d:6813:6869 with SMTP id
 956f58d0204a3-64e630db1e0mr5468159d50.73.1773520665304; Sat, 14 Mar 2026
 13:37:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314092145.7496-1-aethernet65535@gmail.com> <20260314162546.86404-1-sj@kernel.org>
In-Reply-To: <20260314162546.86404-1-sj@kernel.org>
From: Liew Rui Yan <aethernet65535@gmail.com>
Date: Sun, 15 Mar 2026 04:37:34 +0800
X-Gm-Features: AaiRm51xL3AUkg6kP6lI9CYOzld0LBeKXax_xM2GzdwD2vIebs67Jc_XwBf8SDw
Message-ID: <CAPLv50rMiS+PBFh6BQ1f1XZAJu=1hMOaSx6ySQgeHxAY=i1mQA@mail.gmail.com>
Subject: Re: [PATCH] Docs/mm/damon: document exclusivity of special-purpose modules
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 12:25=E2=80=AFAM SeongJae Park <sj@kernel.org> wrot=
e:
>
> Hello Liew,
>
Hello SeongJae,

>
> And thank you for fixing this!  But, the broken "contents" directive is a=
dded
> by a commit on damon/next tree [1] that not yet planned to be upstreamed.=
  That
> is, seems this patch is based on damon/next tree.  As a result, this patc=
h
> cannot be cleanly applied on mm-new.  We prefer making patches based on m=
m-new
> unless there is a reason.
>
Okay, I will make sure to follow this in my future submissions.

> >
> > Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
> > Link: https://lore.kernel.org/damon/20260314002119.79742-1-sj@kernel.or=
g/T/#t
>
> I think it would be nice to give a context about the link.
>
That makes perfect sense.

>
> Reviewed-by: SeongJae Park <sj@kernel.org>
>
Thank you again, this marks my first contribution to Linux, and I truly
appreciate your guidance!

>
> Assuming you agree to my above suggestions, I added this patch to the top=
 area
> of damon/next after dropping the "contents" directive fix and adding a si=
mple
> sentence describing the context of the link.  The change made to this pat=
ch for
> that is as below.  If you don't mind, I will post it as v2 of this patch =
by
> tomorrow morning in Pacific Time.  Please let me know if you have any com=
ments
> about the plan.
>
The plan sounds great to me. Thank you for taking care of the v2
submission!

Best regards,
Rui Yan

On Sun, Mar 15, 2026 at 12:25=E2=80=AFAM SeongJae Park <sj@kernel.org> wrot=
e:
>
> Hello Liew,
>
> On Sat, 14 Mar 2026 17:20:22 +0800 Liew Rui Yan <aethernet65535@gmail.com=
> wrote:
>
> > Add a section in design.rst to explain that DAMON special-purpose kerne=
l
> > modules (LRU_SORT, RECLAIM, STAT) run in an exclusive manner and return
> > -EBUSY if another is already running.
> >
> > Update lru_sort.rst, reclaim.rst and stat.rst by adding cross-reference=
s
> > to this exclusivity rule at the end of their respective Example
> > sections.
>
> Thank you for doing this!
>
> >
> > While at it, fix a Sphinx syntax error in the "contents" directive in
> > design.rst (missing space after :depth:) that prevents the table of
> > contents from being rendered on docs.kernel.org.
>
> And thank you for fixing this!  But, the broken "contents" directive is a=
dded
> by a commit on damon/next tree [1] that not yet planned to be upstreamed.=
  That
> is, seems this patch is based on damon/next tree.  As a result, this patc=
h
> cannot be cleanly applied on mm-new.  We prefer making patches based on m=
m-new
> unless there is a reason.
>
> >
> > Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
> > Link: https://lore.kernel.org/damon/20260314002119.79742-1-sj@kernel.or=
g/T/#t
>
> I think it would be nice to give a context about the link.
>
> Other than that,
>
> Reviewed-by: SeongJae Park <sj@kernel.org>
>
> Assuming you agree to my above suggestions, I added this patch to the top=
 area
> of damon/next after dropping the "contents" directive fix and adding a si=
mple
> sentence describing the context of the link.  The change made to this pat=
ch for
> that is as below.  If you don't mind, I will post it as v2 of this patch =
by
> tomorrow morning in Pacific Time.  Please let me know if you have any com=
ments
> about the plan.
>
> '''
> diff --git a/Docs-mm-damon-document-exclusivity-of-special-purpos.patch b=
/Docs-mm-damon-document-exclusivity-of-special-purpos.patch
> index 9e74de3b..db466405 100644
> --- a/Docs-mm-damon-document-exclusivity-of-special-purpos.patch
> +++ b/Docs-mm-damon-document-exclusivity-of-special-purpos.patch
> @@ -11,26 +11,31 @@ Update lru_sort.rst, reclaim.rst and stat.rst by addi=
ng cross-references
>  to this exclusivity rule at the end of their respective Example
>  sections.
>
> -While at it, fix a Sphinx syntax error in the "contents" directive in
> -design.rst (missing space after :depth:) that prevents the table of
> -contents from being rendered on docs.kernel.org.
> +This change is motivated from another discussion [1].
> +
> +[1] https://lore.kernel.org/damon/20260314002119.79742-1-sj@kernel.org/T=
/#t
> +
> +TODO: move below changelog to the comment section when posting
> +Change from v1
> +(https://lore.kernel.org/20260314092145.7496-1-aethernet65535@gmail.com)
> +- Drop contents directive fix
> +- Reword description
>
> -Link: https://patch.msgid.link/20260314092145.7496-1-aethernet65535@gmai=
l.com
>  Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
> -Link: https://lore.kernel.org/damon/20260314002119.79742-1-sj@kernel.org=
/T/#t
> +Reviewed-by: SeongJae Park <sj@kernel.org>
>  Signed-off-by: SeongJae Park <sj@kernel.org>
>  ---
>   Documentation/admin-guide/mm/damon/lru_sort.rst | 5 +++++
>   Documentation/admin-guide/mm/damon/reclaim.rst  | 5 +++++
>   Documentation/admin-guide/mm/damon/stat.rst     | 5 +++++
> - Documentation/mm/damon/design.rst               | 6 +++++-
> - 4 files changed, 20 insertions(+), 1 deletion(-)
> + Documentation/mm/damon/design.rst               | 4 ++++
> + 4 files changed, 19 insertions(+)
>
>  diff --git a/Documentation/admin-guide/mm/damon/lru_sort.rst b/Documenta=
tion/admin-guide/mm/damon/lru_sort.rst
> -index 06a46812a728c..0198dfe87f4d5 100644
> +index 73980bacc3a02..56690646cf398 100644
>  --- a/Documentation/admin-guide/mm/damon/lru_sort.rst
>  +++ b/Documentation/admin-guide/mm/damon/lru_sort.rst
> -@@ -353,3 +353,8 @@ the LRU-list based page granularity reclamation. ::
> +@@ -351,3 +351,8 @@ the LRU-list based page granularity reclamation. ::
>       # echo 400 > wmarks_mid
>       # echo 200 > wmarks_low
>       # echo Y > enabled
> @@ -40,10 +45,10 @@ index 06a46812a728c..0198dfe87f4d5 100644
>  +purpose modules exclusivity <damon_design_special_purpose_modules_exclu=
sivity>`
>  +for more details.
>  diff --git a/Documentation/admin-guide/mm/damon/reclaim.rst b/Documentat=
ion/admin-guide/mm/damon/reclaim.rst
> -index c5b4d8a1b0014..a37ce6fdff050 100644
> +index 552a7786b0829..6f580f637134a 100644
>  --- a/Documentation/admin-guide/mm/damon/reclaim.rst
>  +++ b/Documentation/admin-guide/mm/damon/reclaim.rst
> -@@ -331,6 +331,11 @@ granularity reclamation. ::
> +@@ -318,6 +318,11 @@ granularity reclamation. ::
>       # echo 200 > wmarks_low
>       # echo Y > enabled
>
> @@ -56,7 +61,7 @@ index c5b4d8a1b0014..a37ce6fdff050 100644
>   .. [2] https://lwn.net/Articles/787611/
>   .. [3] Documentation/mm/free_page_reporting.rst
>  diff --git a/Documentation/admin-guide/mm/damon/stat.rst b/Documentation=
/admin-guide/mm/damon/stat.rst
> -index 468c122c42594..46c5dd96aa2ed 100644
> +index e5a5a2c4f803a..c4b14daeb2dd6 100644
>  --- a/Documentation/admin-guide/mm/damon/stat.rst
>  +++ b/Documentation/admin-guide/mm/damon/stat.rst
>  @@ -45,6 +45,11 @@ You can enable DAMON_STAT by setting the value of thi=
s parameter as ``Y``.
> @@ -72,19 +77,10 @@ index 468c122c42594..46c5dd96aa2ed 100644
>
>   aggr_interval_us
>  diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/=
design.rst
> -index 0a3b77ec458fe..3694c541e65aa 100644
> +index 29fff20b3c2a9..dc37402c0fee9 100644
>  --- a/Documentation/mm/damon/design.rst
>  +++ b/Documentation/mm/damon/design.rst
> -@@ -5,7 +5,7 @@ Design
> - =3D=3D=3D=3D=3D=3D
> -
> - .. contents:: :local:
> --   :depth:2
> -+   :depth: 2
> -
> - .. _damon_design_execution_model_and_data_structures:
> -
> -@@ -960,6 +960,10 @@ more detail, please read the usage documents for th=
ose
> +@@ -853,6 +853,10 @@ more detail, please read the usage documents for th=
ose
>   (:doc:`/admin-guide/mm/damon/stat`, :doc:`/admin-guide/mm/damon/reclaim=
` and
>   :doc:`/admin-guide/mm/damon/lru_sort`).
> '''
>
> [1] https://origin.kernel.org/doc/html/latest/mm/damon/maintainer-profile=
.html#scm-trees
>
>
> Thanks,
> SJ
>
> [...]
