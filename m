Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1BFE57D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Apr 2019 17:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbfDJRDS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Apr 2019 13:03:18 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34673 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728412AbfDJRDS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Apr 2019 13:03:18 -0400
Received: by mail-qt1-f195.google.com with SMTP id k2so3767086qtm.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2019 10:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3S3EtzvI72IztZ1OecbcYhWottrkySxyyi6Vj03NVHg=;
        b=jNo5WGDEjci/sBFz88NZUSV1BNp9SwSmK+dVLGLE5nLOXa3ytE+LQ+0Wb1uFLlGfe5
         ShS/+GnDeFNStQpmP4wN4yO0WIMh0jMVyfO+BAW5GVyDAHEhQ6mfm4d7hgBpz9HT6EmZ
         zty6S6z0xO2MgN4SEyCLd9rYAp95JZqxgVQ0qS8vxRIrCpn/A4htKD8qyskGkIPRN3Ot
         wPouNwN7Xbhtb1CEg9ksnIvG00uym8jlIaR6ZqdEDrv3QBbUF3of7lfWc77DWsmaImoD
         5glwh0kMkg3RFgSVyhbjyuFE9sXlqBeX64WaUoRDeuDLPZRSp5k/2nokH42ynT/5tLEa
         81lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3S3EtzvI72IztZ1OecbcYhWottrkySxyyi6Vj03NVHg=;
        b=J+kPFAM11ep1YEUMmub/3SmHzPAzjzXpWc4OotabS/h2poUG2zG3k/bqsE889e6U0P
         JRjKZICII+g5VWJgk/hsnomg64wyIlWop/DBdbvirc31HEEsbzknWsXxunoPJ9kRF8Sb
         icRKvKjS8hvoUOFbP1aTHXen1lTAN72sphqir8zLw/78AnOeo+GF7363aWwDzPA9O6uf
         4b/B1giU8GsVyr5C+xOonxViNYOGWUuImtT/AqISB+tY370uv6Ln0YngBpSER5pH31w8
         oYLiQimmmT8cUmCaQVlxCFrhGYGhKzoWywyNZFnSNhfXyNzoqBcV7baioSLifRH80bj7
         zPig==
X-Gm-Message-State: APjAAAVF0WxzcFsHOzuAoDq0ikSQEzwBIuaMo/TwAUu35/ODln6VAK7/
        F8ExAXipz54e6pPXkXBo+yEd6A==
X-Google-Smtp-Source: APXvYqyca4r7fdowtvFUi4zx06RO6WTnatbNC4NrwBytBQkNptGP9xQOgCYQuVVSQbgu8RXxewSJsg==
X-Received: by 2002:ac8:1a6d:: with SMTP id q42mr35959956qtk.129.1554915797573;
        Wed, 10 Apr 2019 10:03:17 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-49-251.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.49.251])
        by smtp.gmail.com with ESMTPSA id x14sm23410371qtc.44.2019.04.10.10.03.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2019 10:03:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hEGd2-00042L-5H; Wed, 10 Apr 2019 14:03:16 -0300
Date:   Wed, 10 Apr 2019 14:03:16 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Sasha Levin <sashal@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-integrity@vger.kernel.org, linux-kernel@microsoft.com,
        thiruan@microsoft.com, bryankel@microsoft.com
Subject: Re: [PATCH v2 1/3] ftpm: dt-binding: add dts documentation for fTPM
 driver
Message-ID: <20190410170316.GK8997@ziepe.ca>
References: <20190409184958.7476-1-sashal@kernel.org>
 <20190409184958.7476-2-sashal@kernel.org>
 <CAL_JsqLXcY9VFuY8xZvek0ybUXetS27jL-PW0XGLSVQR3Nc5aw@mail.gmail.com>
 <20190410161949.GC11568@sasha-vm>
 <CAL_JsqJ0p8MsFe2HnqVHvdGyz=6P7dV++xj1d1TTgcobsFqpjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ0p8MsFe2HnqVHvdGyz=6P7dV++xj1d1TTgcobsFqpjg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 10, 2019 at 12:01:37PM -0500, Rob Herring wrote:
> On Wed, Apr 10, 2019 at 11:19 AM Sasha Levin <sashal@kernel.org> wrote:
> >
> > On Tue, Apr 09, 2019 at 04:18:29PM -0500, Rob Herring wrote:
> > >On Tue, Apr 9, 2019 at 1:50 PM Sasha Levin <sashal@kernel.org> wrote:
> > >>
> > >> The parameters are similar to the ones used by IBM's vTPM and the
> > >> various I2C tpm drivers.
> > >
> > >Bindings describe h/w (or firmware interfaces in this case), not drivers.
> > >
> > >>
> > >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> > >>  .../bindings/security/tpm/tpm_ftpm_tee.txt          | 13 +++++++++++++
> > >>  .../devicetree/bindings/vendor-prefixes.txt         |  1 +
> > >>  2 files changed, 14 insertions(+)
> > >>  create mode 100644 Documentation/devicetree/bindings/security/tpm/tpm_ftpm_tee.txt
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/security/tpm/tpm_ftpm_tee.txt b/Documentation/devicetree/bindings/security/tpm/tpm_ftpm_tee.txt
> > >> new file mode 100644
> > >> index 000000000000..20fca67a56c4
> > >> +++ b/Documentation/devicetree/bindings/security/tpm/tpm_ftpm_tee.txt
> > >> @@ -0,0 +1,13 @@
> > >> +Required properties:
> > >> +- compatible: should be "microsoft,ftpm"
> > >> +- linux,sml-base: 64-bit base address of the reserved memory allocated
> > >> +                 for the firmware event log
> > >> +- linux,sml-size: size of the memory allocated for the firmware event log
> > >
> > >Firmware is defining linux specific properties? What if I want to run
> > >BSD? We should use 'reg' here instead.
> >
> > This is based on already existing code that defines these names, see
> > tpm_read_log_of() in drivers/char/tpm/eventlog/of.c .
> 
> BTW, that probably needs updating to handle endianness correctly.

IIRC this legacy IBM code has broken endianness in the firmware..

All that stuff in read_log_of, and the related DT stuff, is historical
IBM special case-ness and should not be copied into new things.

Jason
