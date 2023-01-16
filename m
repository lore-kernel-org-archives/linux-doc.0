Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098C2C46467
	for <linux-doc@archiver.kernel.org>; Mon, 16 Jan 2023 12:39:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbjAPMjX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Jan 2023 07:39:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbjAPMjW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Jan 2023 07:39:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF4D91E28B
        for <linux-doc@vger.kernel.org>; Mon, 16 Jan 2023 04:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673872719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vMC7IzmlZ9zyaSEbvkpVXyZRZpRHzxrTjtlIuL9e/AE=;
        b=RY1AMehYOlGyfmXc0RRg8VUSdEHR6fR4UeqgI6G/pxK3C1iwPwdqmde6HOLWmkxSHzLgoS
        eylDv7byhFSg+8chDAubMkCxwCHGgqt4Hi2Go+NSit/uSlmnrt7D5tkbSX7g75ohoiPeAQ
        ylzR6dPsn9SeK0YMHT9H96eFkTQBcUU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-aj8kp0duOUenCQgb28X6bw-1; Mon, 16 Jan 2023 07:38:37 -0500
X-MC-Unique: aj8kp0duOUenCQgb28X6bw-1
Received: by mail-lf1-f69.google.com with SMTP id g28-20020a0565123b9c00b004cc8a085997so6870858lfv.13
        for <linux-doc@vger.kernel.org>; Mon, 16 Jan 2023 04:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vMC7IzmlZ9zyaSEbvkpVXyZRZpRHzxrTjtlIuL9e/AE=;
        b=pH55M09TJ8CSb3Q0n9OfxX8Gq1qmHs924ht4YA5Jm4ayLxugrNWZI0jnPYyADstGG9
         DVyBbrcTzxbxP7cLjSoCoFs3FXRP/erHTYwBZFdGh1ekBF3nkjC/c3z5JjjBEXyByYCq
         1mu5DNAl0PrGUz3YN1eU7JuVHRqDHLaOYGHfUG6rBSOWg9bBgb8OycxmOVDJ3mJ41E1A
         mOcUoBbxREAMndUv4lkCTtmek68g8OutLFfeFySqOZJFCPUicfk9EbigYt5yqa4APbM8
         qPWvfpSe+loFbmTAVyBH6hjn7Y/WXSLqhCbBSV6Q0xCEu/dfT5Oq1qtVqfAX6LxKOOKp
         Znxg==
X-Gm-Message-State: AFqh2kprjrGhdMvvNA5MWbTefg3Qq4XrV/RvO4icYsLeQhp5fwoqaPxf
        HnGKPHR+TND5GaN0OHyRwv7m6j9z+PWQj+9ytPDnj+dmBqoaWrLXV3SfHlCgybHbntrs7VoF40o
        CskG+rjwDLcqkeD9YReCX
X-Received: by 2002:a19:f514:0:b0:4b5:61e8:8934 with SMTP id j20-20020a19f514000000b004b561e88934mr23410954lfb.64.1673872716356;
        Mon, 16 Jan 2023 04:38:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtbtG8HGa47c9RU6K67MGza9pSGgqJZjaJyrdKqUM9S/apI57wVq1SaCwnjhvFPrXq7JWidYA==
X-Received: by 2002:a19:f514:0:b0:4b5:61e8:8934 with SMTP id j20-20020a19f514000000b004b561e88934mr23410947lfb.64.1673872716156;
        Mon, 16 Jan 2023 04:38:36 -0800 (PST)
Received: from greebo.mooo.com (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.gmail.com with ESMTPSA id w4-20020a19c504000000b004b5812207dbsm5027673lfe.201.2023.01.16.04.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 04:38:35 -0800 (PST)
Message-ID: <d81a67c489eee5f045939db24cbdd6984ad3d030.camel@redhat.com>
Subject: Re: [PATCH v2 5/6] composefs: Add documentation
From:   Alexander Larsson <alexl@redhat.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>, linux-fsdevel@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, gscrivan@redhat.com,
        linux-doc@vger.kernel.org
Date:   Mon, 16 Jan 2023 13:38:35 +0100
In-Reply-To: <Y8IffF7xjyX6BzUE@debian.me>
References: <cover.1673623253.git.alexl@redhat.com>
         <a9616059dd7d094c2756cb426e29ce2ac7d8e998.1673623253.git.alexl@redhat.com>
         <Y8IffF7xjyX6BzUE@debian.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 2023-01-14 at 10:20 +0700, Bagas Sanjaya wrote:
> On Fri, Jan 13, 2023 at 04:33:58PM +0100, Alexander Larsson wrote:
> > Adds documentation about the composefs filesystem and
> > how to use it.
>=20
> s/Adds documentation/Add documentation/
>=20

Thanks, I'll apply your proposals in the next version.

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
=3D-=3D-=3D
 Alexander Larsson                                            Red Hat,
Inc=20
       alexl@redhat.com            alexander.larsson@gmail.com=20
He's a shy pirate astronaut on his last day in the job. She's a plucky=20
paranoid museum curator with an MBA from Harvard. They fight crime!=20

