Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B095240DFCD
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 00:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878468; cv=pass; b=XsxCFKH/kCpUy0SozNE+jwo/MQ69MyyE71M9kZO9mYQp/FMEpM5zhA7hOxEAXnA8sWfYJPri2WPb5XWNbfNxGEY32u0bRCpUQVa+gq8YxwCVVj1mLn6B2+gp7Tx4aHAEzh+zmeg33W/qwpTN/KIOeH0O48/WvwOUnStkQjvcSpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878468; c=relaxed/simple;
	bh=Z1Eppi4t61h5IqOOyFtk+5Sf5eFEruhmxVwcy6Q7eCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7U+PCqkkfGOUfolRo41m6GljNHfKfXw0o9Wc7sAyVzuAukzN5YLJbhKXtyiu3pwOJ0LvFEnzHrCJj5xabVxBURdIbw74HU8qI22v5enRjx61qgUEamIdUDO8K8G5Yi7ksn0i+MDwr1JXZO+EbDWzUg15jOZt2lrtnsX9RHH0IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/lLtCYV; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/lLtCYV"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-409de4132b5so341959fac.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 17:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773878465; cv=none;
        d=google.com; s=arc-20240605;
        b=Rl+VIjvbFL9h9hN1pJlLLCi0ytq1bECWFmcuDLZg9bTQ520LI6GcUaMgYDHGpJe84Y
         MdOb7O5rRo3OynEXSL2ltE4a/960LNm4H5hxDtdURiqi8p92RQkv2/XOM/lkbsLAzEVA
         mN3Fa7ESJSlyGzVq9E1MMTNSPL/9XxazeSf6ksoDVNKRbHFKU7OL9KFTDYr7Is2uBNI8
         lVOwbM15G4qlLS6u3ipR9ksPOrotf2IPE2cXssn5O1MrCnvrCs3V3gKLOGGcR0cHA1HX
         nIYQD3VnkH+l5vDTXkydMf5xcbW1yamt3D+vfR/jxm+cO1BqFUiA9JPrqdIflT2BhwfM
         hyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lW7/d1mV4GQ3QjUEE4TN4adEdBNx7Bw/7j8mQ7OvXSo=;
        fh=MrEuju4FK4iljCFH2UsbVJfCW/CGquxOlTBW2d+x2J4=;
        b=T1yxk/48fJrIGBbGSA+w0p6yqQDMopDFY7zB+F794a02tueVC+Akc8kk71uwChs/n5
         qghDfOP0xFJaikD36oXTmTbYTInQx4Nqk5tDoEaYXGg39QcArN3ystHxFv9QdikpbOcW
         5f6B8zyn5Y+frTTo3mpK0WHVRXkEL2AuA+8ei2TNKC6D74AdISWYmo1yMUWIau8owb3Y
         hbsPrLumUtmKoJeKVheviEm/rjFhpTG/zNWQ3prMjNtfTrfotdsmXKUc3IuZaTDRNL2Y
         PichjEF3PFrpRzDN7mVgH+jIIxDfwv3gtqsT3kdzPYtt1iYtd4He/OtGkqzNRQmdXQ7T
         wo5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773878465; x=1774483265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lW7/d1mV4GQ3QjUEE4TN4adEdBNx7Bw/7j8mQ7OvXSo=;
        b=j/lLtCYV/xG4EmlR0TFw7z1IWSH5AhXC6Seda2nOVphXySFFk/c8bmt+XTBKi+WcRk
         25DQhfnUmA7QY00rS9z7XEfPkbFBkV2uWkSlhJnsPNj1qqiTXhzxu4YVbgmnvY0P9JOs
         GHUqE+V3ROH7MI7RWAzg/2HVGDS/7nZYaQO79PtZtA5gnkAakMmO8OvsgtCozzY6ZN36
         RbwBVtjhuwOtajNU58KwJlcmAOaVIDuI81dgt02lwwZ1gWfg95CSWFEozYOPNRxyiQn8
         U1tAgb6PYhJ0OkUVcqEKNwQgii3KNSqdsNceiosQxyRJ5KRuIC6INb+dLbimWciqcecq
         d2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773878465; x=1774483265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lW7/d1mV4GQ3QjUEE4TN4adEdBNx7Bw/7j8mQ7OvXSo=;
        b=ZwrA+L8WS9+JQYD4bnvvuLLEll3hKvcgECLKzDuRnrbRr2KkWX9El7G/9F6iYDiVV1
         mMiOqxWtZja61PA8jx2i/GcoBNxs73CVADYHUZkjvBbYqUINjkiUfa8T9o7h3nM0bfyH
         DVOVmK76FIxzXX30TYAF0oiFE/LkCcMdol4QAqiJYz3I6uF9tnuJvwRAr+H/S4QNb5HG
         UQVfcycr/aKKskqAaXnLNI29pzNuVFeabTsH/D2udIiC8v7/BUy3eEsFdU7mHjwyWqTW
         zJQlenSPLFA4Srb0z23a4m025mIaofX/d5jN0BKJFQCPfWbc0h1sDzW/CUuhxBqbViYg
         7rrA==
X-Gm-Message-State: AOJu0YwnNsRLa0KkWCneRVlPczEVFbDbVwF0okyOX9j8W5cw7vryH7F5
	/dMe8YhhSnPesvDvW4LmAHtaXNwTGuuUkPoFujBXiAqJpSBP5vhvLHPriFyq2fiGq6EfHu7zO82
	eIIVhQUvFA9eT++O1nUNAN3Ny96mYc2VOjr9QHX8=
X-Gm-Gg: ATEYQzwTsGjW8do4/+v/LhFzkB3LbT9jyrw88B8WAflHpNbrHAYVAbW03ja0h4ADa+N
	fb2zWItfroFjMPh+iSN2gxT/grCT9DlnYqlSeSsjLUgN4UEV12a30kyAI+nHfPRe7/vXkRZxZFX
	CnzK8I9xXqFb3TOIr/ApMqI/KDh5pwoSYJarACIp+BtVym0wJX1JKULsAH/Ye9GWY5srENuP0y7
	bP2LwRy/hkMFpZnZJnxTyrPO//8+Ref+xRIUFLT3sNzzfOR/GBpmzD/qQGRaXD6wOMdcuwTB3A3
	+vo4sDgapS4ZEgyY5Bnj3w1IeME0+XNjmlTk+6zoG6XJsSOZCHsAWXUshOxYOcCRdu9EH+13raJ
	uZ39OuU3X
X-Received: by 2002:a05:6871:70f:b0:417:6914:837a with SMTP id
 586e51a60fabf-41bd4041699mr3645985fac.41.1773878464974; Wed, 18 Mar 2026
 17:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318223325.386762-1-danielmaraboo@gmail.com> <20260318223325.386762-3-danielmaraboo@gmail.com>
In-Reply-To: <20260318223325.386762-3-danielmaraboo@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 18 Mar 2026 21:00:53 -0300
X-Gm-Features: AaiRm51FAR95azVBvayKGS6QE5cgTrwWX5ztqncjdTImjb-PvQ0a3UnK-pMG-rQ
Message-ID: <CAMAsx6e-TTbZJvnydKENRJOyH1nT-MWyZU5Vnfsb-Usu8pNW7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/pt_BR: translation of maintainer-soc-clean-dts.rst
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 7:34=E2=80=AFPM Daniel Pereira <danielmaraboo@gmail=
.com> wrote:
>
> Translate Documentation/process/maintainer-soc-clean-dts.rst into Portugu=
ese.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |  1 +
>  .../pt_BR/process/maintainer-handbooks.rst    |  2 +-
>  .../process/maintainer-soc-clean-dts.rst      | 28 +++++++++++++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/pt_BR/process/maintainer-s=
oc-clean-dts.rst
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index d6a28bc5a..86a608ac8 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -71,3 +71,4 @@ kernel e sobre como ver seu trabalho integrado.
>     Manuais dos mantenedores <process/maintainer-handbooks>
>     Processo do subsistema de rede (netdev) <process/maintainer-netdev>
>     Processo do subsistema SoC <process/maintainer-soc>
> +   Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
> diff --git a/Documentation/translations/pt_BR/process/maintainer-handbook=
s.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> index 71ea0b9d6..8329d2304 100644
> --- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> +++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> @@ -15,4 +15,4 @@ Conte=C3=BAdos:
>
>     maintainer-netdev
>     maintainer-soc
> -
> +   mantainer-soc-clean-dts

Hi

I noticed there's a small typo a missing letter in the file name link withi=
n

maintainer-handbooks.rst
in the patch.

I will correct this and send v2 of the patch tomorrow.

Thanks,

Daniel
