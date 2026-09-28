Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7175454706C
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618033; cv=pass; b=SJrGjCV7EVgZyrBQGhnV1WAUVWZ/wGjOmGTx+FQL7UZyLiyD8tpFb5M2VAYlSPtNQ/xl6WFOXKZLRXRTJmJ6+TfrLRaYDxzuT/hixDAIPhQXPpsgyKtT2Ko/J6lfeUjZf0juMu9zbOOid1tS+3Z4m3swHfwF3/edcjRRR69iQms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618033; c=relaxed/simple;
	bh=2kNG+wBoo1LXnVxUU7YpNWdNJd2rymZ+d19jEj0AZXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opGF0YUoBhmvjrkiiEp0A7lK4mGLCsn9EDP9sMjw0hRYM+H3z5nGSdi2W55eXw9YDVIKqruW3kQpO0UIiZT3LxOdvfKJLrR7YHv1g4RxDHS+PYfsJW0fldp5muYyfsaskF1qa4YrgyojfkhrZO/15arMBAaqO1GnCFXamB7/4W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=FEsBMcKI; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="FEsBMcKI"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-81c01f53a3fso175912a34.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790618029; cv=none;
        d=google.com; s=arc-20260327;
        b=lCfIZMAZuRrKC9Gh/nO134xJdzAbK7CJHol3D7hlncbfPOMVoEQl1Y6lyxtXaXHgOP
         NSo1RIYbVclg3IGaoMCgxs/UuIguDcy2T/aNVK68SKL/dMfp+aR4jQBWw/JnoZSunE0k
         RCw5WzMIRioVgHz22LWBeI5pyjMwX0DSJut0YlUTaZqdHVOMSf6Obn7h50VdgbHQ3bFy
         ZZvzQ7kBBgCS4NssCk9jNxKSiWcvJjykVaUd5KMENyIOqYlIjK+9ZpxbyUFAIcWJk8Sz
         XSoOcPmnMt+zuPrM5loFn6nRVvtROx/GeF1hujNNccmHN34aLlfGu3JGe9VmOJT7khsf
         tTnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pxorRVrnA629ZxhkkzbuPJrftY5VCgA7nPzvnQoi4i8=;
        fh=+rC0JY9P8R4SjUxRwFl+Lgb3kruKtStW9A7GZkXkg4Q=;
        b=I8xbU0XD9+OaZjhx8aZX9RaZbEdq3J+que6eQCiUnTQsVX72rYydijBsJj9X6qgGmI
         tmx1KMUafVmYHKCdZ28xRlPn6wik8bvhWKWlYLmbMZ3jw1lQrGInsYYrnvhBOECyTKKU
         v1vsnJw9wHjgxZuNEGsRUJfcAPBJO8w/ofi/SgtlY3cbxOqJeBbIdt8ZoowYfld2CL0K
         rwfvJjDGvrCioLEDYcdmtvIy9ktKmtORvEPUf7ar1rwV2OblLPAcGPQdyHbNMNYYnA42
         kgudwChhsaonhA9V2EKVeiaCVvJ0KT/Bq3C9+pm9oP4xJG/NN6hNxL6h+PpyIvI63mkT
         O1Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1790618029; x=1791222829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pxorRVrnA629ZxhkkzbuPJrftY5VCgA7nPzvnQoi4i8=;
        b=FEsBMcKIGfj95sMSo6NPiSGSxjKIY5b2uRvmr2NI0GfUEhege9pHgCandUX1/CE4pQ
         vSeyFstbxNFx3M0wcrOBxGLkDkyY4VjT+2XoVhZODsBtHSPO6yJ9SwO4Vhoz5SZkQgjf
         pMLIbVZf3VjQCsSFzR3okAw2ct6ooi7/rPQ0UDDptK++0lcC8MrnUaGUBfeZBUze6r6/
         SRybZgyNdeHEL/GlqKoO3tZtzgHqcN3gv5OwAWBGENEK5fOblbv+TwAoDI0/w4/ykW/d
         eQ9+EgYzDyZloSMfX5AEIPk3Y3g4MmS/JKbic363fh1xfVCShfZJumyUr+fz0TT7/i0G
         ZMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618029; x=1791222829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxorRVrnA629ZxhkkzbuPJrftY5VCgA7nPzvnQoi4i8=;
        b=YGBZkhey+7YaK0U5LPWoILFwwmsB+OrvsWzS3N5ULonC6syM5AJParfy5ptTlgy2iP
         6BiwvH+47tdJsCQl1eVWPPosjrPEILTELRQ9iQqiqvAgCR+s8tgnpTPH/uQLuZpGITQ4
         c7V0+R2/8r61CpZGqqA3RO/SVn2aPLkfDYts3Ks8c6dMH5cpkGZYfiovCn6n96E8+FnH
         19x4cdf/zDwl6/C6OxTZZkb9bZfgf8qOzTb0HeBfYWVCH1agFK+D6XgdnYx27xta3A4/
         DTULmHWyTHgujAx6WXTtpj6nShLzsr0z2pq2QWy1xJ0+65YJL6o9loQDXizUCxETE/nu
         IIWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwifI2/oUMjV0K05RrV0lMS+TXehg8y5YJ8g1MxovGDzUE71bwlukO6LiTqEMKdLmrxDtI4TRBTWHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7tyedlcaBmErLtmXDTHvMfLCdGlWN6yzq8rm+c8lSceirR7va
	30BME41ojZ8nxT8A4uO3LwCWY3QyXWnfNlILZHNfIr5wMcSlJsm3etE9ZzXpHER7xrhNUpe4d0w
	tPI/sM4k0SgpuQ1qvzMLREMmcZrbNM8dPIo5gczYaZKup0GST8/0v4aaSMQ==
X-Gm-Gg: AYBFou0nJVqnBp5dddDf5hbhrzzndzkpjv4AU6Rfv6reGo6Wa+JEcxuCAHqJccSQ4NE
	CinbRF5fEffCmPbsp75OnwXTTVhyQ7dUpuMckzMrRgxlzPWNga6EGsZyY1NgEbQWxj9WVJhbhoA
	uHdFh5ayQweW1x/eSGrI3C0rgOpqWPr2ntHnkNPaYmuwuYL7GM03I0fhWEDrc9nygy8iOsr7hhj
	w00wGRC7+WYjnuW8ylqHr2cuvpsSgB17WeiyAFN1BQYDCXryktMblsbP14e78x8mzDO+uGT8din
	GR6TYFOa7+XTNgDxCSUPZRtS7ns6P82IGNeUX8FgOg0BE685mrgFFh7XDTgTtu7hEUo=
X-Received: by 2002:a05:6870:f10e:b0:447:4cf0:eb19 with SMTP id
 586e51a60fabf-4930bb82a4amr15095600fac.4.1790618029099; Mon, 28 Sep 2026
 10:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com> <20260928-b4-ublk-cancel-stop-v1-3-4a4360232a46@toxicpanda.com>
In-Reply-To: <20260928-b4-ublk-cancel-stop-v1-3-4a4360232a46@toxicpanda.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 28 Sep 2026 10:53:38 -0700
X-Gm-Features: AclHuK9nxEm2zBDwrnuiv4JMUs_01csR-Wh_9mfwxHD7EKXDa_-x71ypJIIn4T0
Message-ID: <CADUfDZqDZEM4=uw+By6RnxvLqXbc-iPf8RCUQtQB5_Z_Di84Aw@mail.gmail.com>
Subject: Re: [PATCH 3/9] ublk: publish io->cmd under io->lock in the commit paths
To: Josef Bacik <josef@toxicpanda.com>
Cc: Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:03=E2=80=AFAM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> io->cmd shares its storage with io->req. FETCH, COMMIT_AND_FETCH and
> NEED_GET_DATA switch the io from one to the other in
> ublk_fill_io_cmd() without a lock of their own. That was fine as long
> as everything else looking at io->cmd ran under the uring_lock of the
> same ring, which is the case for the io_uring cancel callback.
>
> ublk_cancel_cmd() is also called from the control path, from
> ublk_cancel_dev() with IO_URING_F_UNLOCKED, and the next patches add
> more such callers which run while the server still commits requests.
> Nothing orders their reads of io->flags and io->cmd against
> ublk_fill_io_cmd() then. A reader can find UBLK_IO_FLAG_ACTIVE set and
> still pick up the request pointer from the union.
>
> The batch commit path calls ublk_fill_io_cmd() under io->lock already.
> Do the same in the other three callers, so that io->lock covers every
> switch of the union to a command. io->lock is per io and only taken by
> the task which commits that io, so the fast path gains an uncontended
> lock in a cacheline it writes anyway.
>
> ublk_batch_prep_io() calls __ublk_fetch() with io->lock held, which
> makes the order io->lock, then ubq->cancel_lock.
>
> The readers move under io->lock in the next patch.
>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  drivers/block/ublk_drv.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 50c99b28ef21..17a33539f271 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -3169,6 +3169,9 @@ ublk_fill_io_cmd(struct ublk_io *io, struct io_urin=
g_cmd *cmd)
>  {
>         struct request *req =3D io->req;
>
> +       /* io->cmd shares its storage with io->req, switch them under io-=
>lock */
> +       lockdep_assert_held(&io->lock);
> +
>         io->cmd =3D cmd;
>         io->flags |=3D UBLK_IO_FLAG_ACTIVE;
>         /* now this cmd slot is owned by ublk driver */
> @@ -3338,8 +3341,11 @@ static int ublk_fetch(struct io_uring_cmd *cmd, st=
ruct ublk_device *ub,
>          */
>         mutex_lock(&ub->mutex);
>         ret =3D ublk_validate_io_buf(ub, cmd, &auto_buf);
> -       if (!ret)
> +       if (!ret) {
> +               ublk_io_lock(io);
>                 ret =3D __ublk_fetch(cmd, ub, io, q_id);
> +               ublk_io_unlock(io);
> +       }
>         if (!ret) {
>                 ublk_apply_io_buf(ub, io, cmd, buf_addr, &auto_buf, NULL)=
;
>                 ublk_mark_io_ready(ub, q_id);
> @@ -3496,7 +3502,9 @@ static int ublk_ch_uring_cmd_local(struct io_uring_=
cmd *cmd,
>                 if (ret)
>                         goto out;
>                 io->res =3D result;
> +               ublk_io_lock(io);
>                 req =3D ublk_fill_io_cmd(io, cmd);
> +               ublk_io_unlock(io);

Taking a spinlock for every ublk I/O completion will be very
expensive. Is it not possible all paths calling ublk_cancel_dev() to
wait for all tags to go idle?

Best,
Caleb

>                 ublk_apply_io_buf(ub, io, cmd, addr, &auto_buf, &buf_idx)=
;
>                 if (buf_idx !=3D UBLK_INVALID_BUF_IDX)
>                         io_buffer_unregister(cmd, buf_idx, issue_flags);
> @@ -3514,7 +3522,9 @@ static int ublk_ch_uring_cmd_local(struct io_uring_=
cmd *cmd,
>                  * uring_cmd active first and prepare for handling new re=
queued
>                  * request
>                  */
> +               ublk_io_lock(io);
>                 req =3D ublk_fill_io_cmd(io, cmd);
> +               ublk_io_unlock(io);
>                 io->buf.addr =3D addr;
>                 if (likely(ublk_get_data(ubq, io, req))) {
>                         __ublk_prep_compl_io_cmd(io, req);
>
> --
> 2.55.0
>
