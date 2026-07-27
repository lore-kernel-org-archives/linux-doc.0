Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7773BE163
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 06:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785132542; cv=pass; b=NYlErLu5b71klTYiSREHtu9n8VTIldYG7XQ9kJPsQ6LS+fjUXoWvchUOL6lmZlESBRevycoDVSkJfFflyHhJ/NE6rHOEFQLxJrjdgDT4WahqIMnG8y0IXfcPIodiBzifUY1uELjHNjoAArTQop5haCCqOSApLnxhGaHq8Bqu4Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785132542; c=relaxed/simple;
	bh=pSaFdYPslW9TXDI/GglMlpgcyBINY3r3x7qU2DHxqQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtHvJ9QD82WxVIJ8O2WFwl1HKB+KA+XOCmLs5Y4mMxU+Tl/nL+12z1/FlsDzsBal/9X4vb8+HH8ZppYVs7IISvC4GAlhR65O9uMRaIMKkdDg2W2w2IbKu7dDmu34mRSn+fNOArLV7sYw0VdSugmeMIgQkQT/UdHUkjwIH9HeKio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uuL42oOA; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uuL42oOA"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c10ed63c0so256081cf.1
        for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 23:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785132540; cv=none;
        d=google.com; s=arc-20260327;
        b=QohrGZsGc6Ps3GXiW0CwAd9138Q6JBF82Q++J3/X7mDc9rjDom/2R+XzFn86NnwcYw
         GMgcFxvp82cT8zlq53uQ2CgKzXB1caF+LtjwwRHHIRbBs1i8+7mqvvMWPtq0VeBZ3eB6
         w9qZSPrsJtgfsGESazl3ESNZOJNt4h4gWJBTvrp/nf9MK+Pii4hF/t1XPQ9msT7IvYHy
         hoNTZ2jo/ETnZHSzEKgCG6MdV5wBdqDMh6jtHg4Up6i7xsC+TiwJldEb2NSsHKirbyte
         JzaDEgw6Pxj380ombmU3nuZBakEEvC2qQlQbzO4OWv6KFgDmyJrY7ezRU0l/dcEf6di6
         YuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yxVSCipOskyRe1PObcvYAS0NZq/LZ8N7sOc0WiapXEY=;
        fh=flwMXjiFQzoSJAC2903J4hWa5eCES7HPgl87GPWDttA=;
        b=SozC4uwU/QONdDjNIzy5Q7nMgmhbqDS8ATINTtH5lMG3DQzhngYqL7/28ZXHCgD93W
         87UZl8A9iB7hGIJ9yB6UQB+OzQ0PMoQoDpjiSkTL0ab9GIJ0FHkZM3SMHgHcAkfwx4ey
         MItwClF0C6+nRIBIdfkZIfqG7r+IPeepa1AB3Rn8NO1e8hrlxAA6nQalHj960mS1/fiP
         AZPZ2dpyoYpTPj5ae1cBsTJas7V4Y/Sv0OsDvzEqpQIQb1iEcvIZYL5xwi5gdIPopX9G
         aJgjaM/vhiEHdWySFzxZLwP5TQCDR7AlHxhnLTMrspyxxRWL3qYvWxcooTGX8cYpYN5w
         gySw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785132540; x=1785737340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yxVSCipOskyRe1PObcvYAS0NZq/LZ8N7sOc0WiapXEY=;
        b=uuL42oOAOcUZ8XSqvlVV1pjY8gNpJDbgjNcne569xl8suFK8D7WaKLV6pfXeyXms/R
         04oG9v0mWFp1LvHm8x+MqBlu2qnDlNEYmTegnOvWXA2JgDp8p4QFrL/KjQC3tiHDsXDn
         LJe/TMX/LBf+v26/T2V/NC7ECdNXWY3mgZd1tQik1OoI5zXhr2lcKVHjlgUj3Usr5itY
         dOWb+IraNQnxffGoXLqtVtpqpHnbW5ToY82yf8flTpzcXdGuVIgcrKsw4NQ37yUuC1o1
         plnLA9/fAcX+2MmC0YqDZ9upW6DNYppeMnl/WkhXI9RMzjWupLXsRzAAdY9HIBZxnb76
         QFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785132540; x=1785737340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxVSCipOskyRe1PObcvYAS0NZq/LZ8N7sOc0WiapXEY=;
        b=StjG+Brf6uEngccK6QTZuO/0dX+qfC6EbQdL/O9XwlQuOoc+mrRcOScxekgKCN2acK
         I7nFBbhZaRVHxhOrmrig1CvPQOILmQI4EqADkVzob7tmVnxmVInnivM/m5AAxuYdtgAB
         +/+zNwicL6VwISg2z8gOV/VlbCBGmndkmPm8P8/niwXdWDyNRFx5oa88q4RsW4aZTKcX
         iXqe0SU51GV7C9hzPEWTZ4srv80AdUMt0YI5wrAnGr+trB2VXlkhwQVWTyjMumliLA/g
         R1BgSYplmaeZvFxJ8UsDyoRwlHG/OMBDHfspLPLgyyCGPBWofAuKUuVHeZB6J3c46COm
         7Iuw==
X-Forwarded-Encrypted: i=1; AHgh+RpkEsdya7epQF1YI8ZDCSWtJbjRYYnyRVZqpsSgO+iy3+lSx19eQZ0Vpmpv11x9FAbjxqjCYfamO6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLR6vOmq+/UDePNBVCpYjtFYQyYYFmDa9CRLqGWJS1RCD6W6vI
	8QVgCk+0tA9rj6p4k5U2AjPQviYOJdKiEotnpjDICmIJdnKFn1PNk5RPJxagTuLGRFfHo/qCA5k
	U2VXzgv7DR/3LTW5UD5VKAO8LOktHd+GJAWwS8Omt
X-Gm-Gg: AR+sD10WwEMBzwupwzvJJeGX22e+v/gOykSxGjh6DQle3lHvvUsJC7j5jtnQPi31I9t
	GZw63xSvSryVemPl1BdFmcJiYiW4VqsdRKz70rKm6Gw4SXmg+d/eRWkVvU60rPmnRbjT80anHjC
	1cDrJcsG3Kc0a5YRs0ve83ph9WmC8lrvKr/QhzcaDhVNw9/wJl+np0V1FD30TXRJtqO/tp6w0+2
	nRDLEbIBqiv07mvOONQTieWQ0UCfI2dNL0zm+DQNnuxvnxaLDGvuR4bnwB7
X-Received: by 2002:a05:622a:a9cf:20b0:517:5ac7:332e with SMTP id
 d75a77b69052e-529a5e705b1mr27233471cf.6.1785132539200; Sun, 26 Jul 2026
 23:08:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723125025.457841-1-cui.tao@linux.dev>
In-Reply-To: <20260723125025.457841-1-cui.tao@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 26 Jul 2026 23:08:48 -0700
X-Gm-Features: AUfX_mywGH3Soeu4QbD274VLCGhnwicLJWcTZwPt6Xymt1t9mYSko4sZyO5tjkM
Message-ID: <CAJuCfpGhijcg1N2AxbRbTHf7FvtaTG_xYL1fPVUA=k7snPYtzA@mail.gmail.com>
Subject: Re: [PATCH] docs: accounting/psi: drop stale 500ms window minimum
 from trigger docs
To: Tao Cui <cui.tao@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, linux-doc@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet <corbet@lwn.net>, Tao Cui <cuitao@kylinos.cn>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 5:51=E2=80=AFAM Tao Cui <cui.tao@linux.dev> wrote:
>
> From: Tao Cui <cuitao@kylinos.cn>
>
> psi.rst says trigger windows range "from 500ms to 10s" with a 50ms min
> polling interval. That minimum was removed in commit 519fabc7aaba ("psi:
> remove 500ms min window size limitation for triggers"): the polling-rate
> protection moved to gating trigger creation behind CAP_SYS_RESOURCE,
> which also stopped capping psi event latency.
>
> Update the wording accordingly: windows up to 10s with no enforced
> minimum; trigger creation requires CAP_SYS_RESOURCE on cgroup pressure
> files, while unprivileged users on /proc/pressure/ are limited to 2s
> multiples.
>
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>  Documentation/accounting/psi.rst | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/accounting/psi.rst b/Documentation/accounting/=
psi.rst
> index d455db3e5808..aae57fb5f15c 100644
> --- a/Documentation/accounting/psi.rst
> +++ b/Documentation/accounting/psi.rst
> @@ -99,15 +99,14 @@ psi metric and deactivates upon exit from the stall s=
tate. While system is
>  in the stall state psi signal growth is monitored at a rate of 10 times =
per
>  tracking window.
>
> -The kernel accepts window sizes ranging from 500ms to 10s, therefore min
> -monitoring update interval is 50ms and max is 1s. Min limit is set to
> -prevent overly frequent polling. Max limit is chosen as a high enough nu=
mber
> -after which monitors are most likely not needed and psi averages can be =
used
> -instead.
> -
> -Unprivileged users can also create monitors, with the only limitation th=
at the
> -window size must be a multiple of 2s, in order to prevent excessive reso=
urce
> -usage.
> +The kernel accepts window sizes up to 10s. The 10s maximum is chosen as =
a
> +high enough number after which monitors are most likely not needed and p=
si
> +averages can be used instead.
> +
> +To prevent excessive resource usage, trigger creation is restricted to
> +privileged users (CAP_SYS_RESOURCE) on cgroup pressure files; on the
> +system-wide /proc/pressure/ files unprivileged users can create monitors
> +as well, limited to window sizes that are a multiple of 2s.

Hmm. From this wording it sounds like we have different trigger
creation rules for system-wide vs cgroup pressure files, which I think
is not true. AFAICT, for both types, we restrict unprivileged users to
creating triggers with 2s window size multiples.

>
>  When activated, psi monitor stays active for at least the duration of on=
e
>  tracking window to avoid repeated activations/deactivations when system =
is
> --
> 2.43.0
>
