Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461A717DE36
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 04:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764562720; cv=none; b=Mxs8e1EJFPbFwYJln+6YDC69jbDmnAuIX6TpFz29cpjToUIjH0wi59BOWE3+XUK/CijW8RE0cHEYPIn4FnN0FTRXUuLHAy9tPDz88ajomMwyJb9SJK/6MXRBFtePgjBvL+V7Om4w4hUJZ8vWlzJlvPkw0NQRSQzPqkadUX5wRpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764562720; c=relaxed/simple;
	bh=jkPMD6GHsCXWpn7rUP9jQrqa/c4UKeSxDfKF/9lJTB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUdlBxaTHq2hTHxE0vxCRTDPiq5k1wgdFuk3spfqZgjciKek//TmXET1GemHu8JHoaIf+z3bbu/ylzpTknu+jp+HXddJPEumxuK1PHFofO/mTUwIcYl/gMbrDmz90bW+o6+Cr5Uu4IS4Az2twOK8RW/2h6FqkjimA+DWm7qGd+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HW7umWsD; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HW7umWsD"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b737502f77bso510721366b.2
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 20:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764562716; x=1765167516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMVbFQJwrtDT4Z0LvdOkvQwxkH7n3jhJLvQGPrvBilI=;
        b=HW7umWsDoQvFygQJn2ifKK+ER+KuG3/4+pLxghHhhVVEiUUpV3izkIMU4Ee4Dp3L7Y
         QBEQr3a7sFOfY28BeuI8lyj21SAXN3IM2q8KdAyO/xPViQ4I1A2md9KWXfccyXqOx03n
         Toz7D1e35ghYZZGpP4NP20E8pNZXDqoF3Y03LahoQQbzgrHXQeMQZUapV+p9fs3kboWo
         NyjB7IYjSl2/1ENe3LH05P02250DCkkFpEPEwRSwHoLdVO9kugrx8+ifPWi6Qrk48Vg8
         utZGTXzyFL+gpSpr9D4h/yt2UOMvKcnM0oTBwrkWv/EE62ioMe0cG1V779u7dz2YN/qC
         Gy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764562716; x=1765167516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AMVbFQJwrtDT4Z0LvdOkvQwxkH7n3jhJLvQGPrvBilI=;
        b=CfZ3rFyYYMLp2/NbMGrH6v8Sf5U49/rgnoDV7Vqw0UAGsxZyv976Qcb8Irnd4TqJ9r
         lwecT8Nxnp77YO2yNu72veEYuxAqcC1U2uOgXQVA1e8Bq5NP/UfKaW/FTUXkZ1D/xUPj
         yWTkQlJ7d/RhKLHYVI3SNHHLJjX8vyDSbOfnhukI06Vb60tVA9axO4s4ApwGIKdpgMgL
         A5FDsaCfn0c9sCjUBk21dWr/LXS/WCaErMUumkoeOL3+Fyik92efl39p0nFTNUyX2RUV
         O7Q/saB8zDoYgm+xH5aYprBV5jzuePQTsuGHF7hB50zrh3m96udd8rp/bSncHkUeVYMv
         60Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVtYuSfnIschy7vapxAJJefe/aW/gySss5rCESvyAor4zZxkUB3viuROLO2a0+2UgFRn/cvzqpydvk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/4Zq7sb7qkCllpSTtPzUUykeSBT09GoFHVK9W8O8OXHRrbrWF
	G5NUbqmXW3sTbp2075m/CgD20QqHUzF8CQlQw4zyWclC5igaDerJRghyG1BXI6UxDJyQkNyyiAh
	Sj0tN51FIw/lqXzLWlyky4rRdAedgCxs=
X-Gm-Gg: ASbGnctrUSX/KXngwtnUSmTWFqtcz+H7QZt6bXHoJCzIMJ+CNWjxsp7pBWz+pFDvzWo
	EKMfjJb55EaT1Ee8J5Hh9vJ3w41BbFDS85LjQznPZ4bt6B88W+paUErzgM5XpXul/MUoYKXqgvC
	OIQGIVnGopEta9J66RJfaWr/DAmeIUSlRACMhqq7EZ8pEK4heRTY5BS+bguzIPvSma4tkfC4mwl
	OZ7h7XEPT7mKrQCqSzqGuE8eU5h2Thu5aCKkqget+wH1h281FWABwLHrUXayH3HFOFGWeGbLmbd
	4w5vcrSUEtuq8j5Gs+f4MOwhVYpb4GtY22X2
X-Google-Smtp-Source: AGHT+IEeTiNhj2dkL9zHMBWy2MWadxfl3ORIHTFpBD3euUzlvLmeTWg5W0jv/zpi7B8w/lH1Tab+xDdjnzwufYN3YuM=
X-Received: by 2002:a17:907:3c96:b0:b73:9368:ad5e with SMTP id
 a640c23a62f3a-b76c5515082mr2667474566b.34.1764562715362; Sun, 30 Nov 2025
 20:18:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
 <20251112042720.3695972-6-alistair.francis@wdc.com> <f7a91a49-9f82-492a-8bf9-520ee1c832ba@suse.de>
In-Reply-To: <f7a91a49-9f82-492a-8bf9-520ee1c832ba@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Dec 2025 14:18:08 +1000
X-Gm-Features: AWmQ_bnRvWBaRf_AYOX9GVK2GmdKNpGnJ5WeFBVDhtY-flit1CL2pb-FbNx9lsA
Message-ID: <CAKmqyKPU2w2GrzdMtMn1rO8auOpDCTovQH04P8RxptA45Oy6XQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] nvme-tcp: Support KeyUpdate
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 11:31=E2=80=AFPM Hannes Reinecke <hare@suse.de> wro=
te:
>
> On 11/12/25 05:27, alistair23@gmail.com wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > If the nvme_tcp_try_send() or nvme_tcp_try_recv() functions return
> > EKEYEXPIRED then the underlying TLS keys need to be updated. This occur=
s
> > on an KeyUpdate event as described in RFC8446
> > https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3.
> >
> > If the NVMe Target (TLS server) initiates a KeyUpdate this patch will
> > allow the NVMe layer to process the KeyUpdate request and forward the
> > request to userspace. Userspace must then update the key to keep the
> > connection alive.
> >
> > This patch allows us to handle the NVMe target sending a KeyUpdate
> > request without aborting the connection. At this time we don't support
> > initiating a KeyUpdate.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > v5:
> >   - Cleanup code flow
> >   - Check for MSG_CTRUNC in the msg_flags return from recvmsg
> >     and use that to determine if it's a control message
> > v4:
> >   - Remove all support for initiating KeyUpdate
> >   - Don't call cancel_work() when updating keys
> > v3:
> >   - Don't cancel existing handshake requests
> > v2:
> >   - Don't change the state
> >   - Use a helper function for KeyUpdates
> >   - Continue sending in nvme_tcp_send_all() after a KeyUpdate
> >   - Remove command message using recvmsg
> >
> >   drivers/nvme/host/tcp.c | 85 +++++++++++++++++++++++++++++++++-------=
-
> >   1 file changed, 70 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> > index 4797a4532b0d..5cec5a974bbf 100644
> > --- a/drivers/nvme/host/tcp.c
> > +++ b/drivers/nvme/host/tcp.c
> > @@ -172,6 +172,7 @@ struct nvme_tcp_queue {
> >       bool                    tls_enabled;
> >       u32                     rcv_crc;
> >       u32                     snd_crc;
> > +     key_serial_t            handshake_session_id;
> >       __le32                  exp_ddgst;
> >       __le32                  recv_ddgst;
> >       struct completion       tls_complete;
> > @@ -858,7 +859,10 @@ static void nvme_tcp_handle_c2h_term(struct nvme_t=
cp_queue *queue,
> >   static int nvme_tcp_recvmsg_pdu(struct nvme_tcp_queue *queue)
> >   {
> >       char *pdu =3D queue->pdu;
> > +     char cbuf[CMSG_LEN(sizeof(char))] =3D {};
> >       struct msghdr msg =3D {
> > +             .msg_control =3D cbuf,
> > +             .msg_controllen =3D sizeof(cbuf),
> >               .msg_flags =3D MSG_DONTWAIT,
> >       };
> >       struct kvec iov =3D {
> > @@ -873,12 +877,17 @@ static int nvme_tcp_recvmsg_pdu(struct nvme_tcp_q=
ueue *queue)
> >       if (ret <=3D 0)
> >               return ret;
> >
> > +     hdr =3D queue->pdu;
> > +     if (hdr->type =3D=3D TLS_HANDSHAKE_KEYUPDATE) {
> > +             dev_err(queue->ctrl->ctrl.device, "KeyUpdate message\n");
> > +             return 1;
> > +     }
> > +
>
> Errm. 'hdr' is of type 'struct nvme_tcp_hdr', and that most certainly
> does not define TLS_HANDSHAKE_KEYUPDATE. I think you should evaluate the
> cmsg type here.
>
> >       queue->pdu_remaining -=3D ret;
> >       queue->pdu_offset +=3D ret;
> >       if (queue->pdu_remaining)
> >               return 0;
> >
> > -     hdr =3D queue->pdu;
> >       if (unlikely(hdr->hlen !=3D sizeof(struct nvme_tcp_rsp_pdu))) {
> >               if (!nvme_tcp_recv_pdu_supported(hdr->type))
> >                       goto unsupported_pdu;
> > @@ -944,6 +953,7 @@ static int nvme_tcp_recvmsg_data(struct nvme_tcp_qu=
eue *queue)
> >       struct request *rq =3D
> >               nvme_cid_to_rq(nvme_tcp_tagset(queue), pdu->command_id);
> >       struct nvme_tcp_request *req =3D blk_mq_rq_to_pdu(rq);
> > +     char cbuf[CMSG_LEN(sizeof(char))] =3D {};
> >
> >       if (nvme_tcp_recv_state(queue) !=3D NVME_TCP_RECV_DATA)
> >               return 0;
> > @@ -976,10 +986,26 @@ static int nvme_tcp_recvmsg_data(struct nvme_tcp_=
queue *queue)
> >
> >               ret =3D sock_recvmsg(queue->sock, &msg, msg.msg_flags);
> >               if (ret < 0) {
> > -                     dev_err(queue->ctrl->ctrl.device,
> > -                             "queue %d failed to receive request %#x d=
ata",
> > -                             nvme_tcp_queue_id(queue), rq->tag);
> > -                     return ret;
> > +                     /* If MSG_CTRUNC is set, it's a control message,
> > +                      * so let's read the control message.
> > +                      */
> > +                     if (msg.msg_flags & MSG_CTRUNC) {
> > +                             memset(&msg, 0, sizeof(msg));
> > +                             msg.msg_flags =3D MSG_DONTWAIT;
> > +                             msg.msg_control =3D cbuf;
> > +                             msg.msg_controllen =3D sizeof(cbuf);
> > +
> This is not correct; reading the control message implies a kernel
> memory allocation as message buffer, not an interator (as it's the
> case here).

I don't follow what you mean

Alistair
