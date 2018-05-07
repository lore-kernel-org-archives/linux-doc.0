Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 08DD77DE74
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 17:08:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752227AbeEGRIJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 13:08:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:37046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752020AbeEGRIJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 13:08:09 -0400
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net [81.96.234.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C07C214DA;
        Mon,  7 May 2018 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1525712888;
        bh=qCy/xl16dNSm+nNL9JF0nqJqVabOrAIItvaUWREnMGo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Qs97S64ATDSb5QdEa0nFTXbXejMNt0E7VuhGkz9cJ2UDqqchqHOEoepBcm/HusAE4
         7pnZ/4rYlsOIAZj+tbXa9TSqu9AW0HrfXzbBy3LAoaY81J/VgM2FLGXadoLdYwYtyI
         FWCpMCEgFmhN+5cenImmbIZH0QXc6+5cDW10DNRg=
Date:   Mon, 7 May 2018 18:08:03 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
Subject: Re: [PATCH 15/18] iio: iio.h: use nested struct support on
 kernel-doc markup
Message-ID: <20180507180803.21e967b2@archlinux>
In-Reply-To: <1a31240699b1b6ee089b5b36889ab27ae14ad94e.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <1a31240699b1b6ee089b5b36889ab27ae14ad94e.1525684985.git.mchehab+samsung@kernel.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  7 May 2018 06:35:51 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Solve those Sphinx warnings:
> 
>     ./include/linux/iio/iio.h:270: warning: Function parameter or member 'scan_type.sign' not described in 'iio_chan_spec'
>     ./include/linux/iio/iio.h:270: warning: Function parameter or member 'scan_type.realbits' not described in 'iio_chan_spec'
>     ./include/linux/iio/iio.h:270: warning: Function parameter or member 'scan_type.storagebits' not described in 'iio_chan_spec'
>     ./include/linux/iio/iio.h:270: warning: Function parameter or member 'scan_type.shift' not described in 'iio_chan_spec'
>     ./include/linux/iio/iio.h:270: warning: Function parameter or member 'scan_type.repeat' not described in 'iio_chan_spec'
>     ./include/linux/iio/iio.h:270: warning: Function parameter or member 'scan_type.endianness' not described in 'iio_chan_spec'
> 
>     ./include/linux/iio/iio.h:191: WARNING: Unexpected indentation.
>     ./include/linux/iio/iio.h:192: WARNING: Block quote ends without a blank line; unexpected unindent.
>     ./include/linux/iio/iio.h:198: WARNING: Definition list ends without a blank line; unexpected unindent.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Great thanks.  I couldn't figure out how to do this last time
I looked at it.

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to ignore it.

Thanks,

Jonathan
> ---
>  include/linux/iio/iio.h | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 11579fd4126e..a74cb177dc6f 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -183,18 +183,18 @@ struct iio_event_spec {
>   * @address:		Driver specific identifier.
>   * @scan_index:		Monotonic index to give ordering in scans when read
>   *			from a buffer.
> - * @scan_type:		sign:		's' or 'u' to specify signed or unsigned
> - *			realbits:	Number of valid bits of data
> - *			storagebits:	Realbits + padding
> - *			shift:		Shift right by this before masking out
> - *					realbits.
> - *			repeat:		Number of times real/storage bits
> - *					repeats. When the repeat element is
> - *					more than 1, then the type element in
> - *					sysfs will show a repeat value.
> - *					Otherwise, the number of repetitions is
> - *					omitted.
> - *			endianness:	little or big endian
> + * @scan_type:		struct describing the scan type
> + * @scan_type.sign:		's' or 'u' to specify signed or unsigned
> + * @scan_type.realbits:		Number of valid bits of data
> + * @scan_type.storagebits:	Realbits + padding
> + * @scan_type.shift:		Shift right by this before masking out
> + *				realbits.
> + * @scan_type.repeat:		Number of times real/storage bits repeats.
> + *				When the repeat element is more than 1, then
> + *				the type element in sysfs will show a repeat
> + *				value. Otherwise, the number of repetitions
> + *				is omitted.
> + * @scan_type.endianness:	little or big endian
>   * @info_mask_separate: What information is to be exported that is specific to
>   *			this channel.
>   * @info_mask_separate_available: What availability information is to be

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
