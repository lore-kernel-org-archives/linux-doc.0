Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1660E7D082
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Oct 2018 05:30:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbeJYOBl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Oct 2018 10:01:41 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37829 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbeJYOBl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Oct 2018 10:01:41 -0400
Received: by mail-wm1-f66.google.com with SMTP id p2-v6so134526wmc.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Oct 2018 22:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Gs9SgyZuw+dbAm6aFOPXkL0Pu2vbsZ/++lD/Uq0//bU=;
        b=Ye2NAM8pj7R+R3sjfvuIugGew6SEcHzoWDzP3TM8IPg7VilLgE2ILqaU5QJFAXlVKQ
         iQSqZabpEnHkxOIzNZIs4lI8rFyAfa72XdoO6Qj5Sa+xJBzJNBvJqyqvFpBqmhoMDuGr
         D5Isju5BkrtEv+YakBnVbq8GGCQljDlwf58jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Gs9SgyZuw+dbAm6aFOPXkL0Pu2vbsZ/++lD/Uq0//bU=;
        b=H0Px3KSJPQ00D9tKvDxZjwQRf7fhvaS4HBZ84+z0w2uTGESpaQf4JM1OdMT74OY5KB
         4rFMxL+22uW+NajEgdZv0PPfJEn45Xa6gbAuLfhvPeRuSTeJqd8o5pry2FN9LqScWpoP
         N8nz2h4v/2NVqS9LMtO46Gb1LzdjRBuOieWsbb7611y1dOWKwbi7h2+LTqP9+ncWESkB
         SEI6MSK4hcSzCePKXEkqmp9E3gjnAHbk3JmhoOvyJBM5TFxcTg5JiGscmzM5pVSz2W9n
         CQy9Y9EYa979Vlcqo84cVOzdXqf/E85W7m6zyyHC4sjzwuLYmOiTbj2dYDGNx+0wWpYU
         u2nw==
X-Gm-Message-State: AGRZ1gLJzAcxheXdAmTpiZo3pjT66NskYDpkxHHsOdhOM+XQERNdSt2h
        uPMF+AbD45DsNSeMAGxd7cVeiw==
X-Google-Smtp-Source: AJdET5ehNHALzH5Dzebf5elfVS5aMvq/tcovbcMP1c2szsGgEfBmv+6If/oxsm3CbFBcfPc6FDWdLg==
X-Received: by 2002:a1c:80d4:: with SMTP id b203-v6mr236310wmd.100.1540445433628;
        Wed, 24 Oct 2018 22:30:33 -0700 (PDT)
Received: from dell ([2.31.167.182])
        by smtp.gmail.com with ESMTPSA id u9-v6sm5374658wrr.66.2018.10.24.22.30.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Oct 2018 22:30:32 -0700 (PDT)
Date:   Thu, 25 Oct 2018 06:30:30 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Eric Sandeen <sandeen@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
        Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
        "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
        Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        David Kershner <david.kershner@unisys.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Johan Hovold <johan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH v8 08/12] mfd: intel-peci-client: Add PECI client MFD
 driver
Message-ID: <20181025053030.GD4939@dell>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
 <20180918215124.14003-9-jae.hyun.yoo@linux.intel.com>
 <20181024105903.GB4939@dell>
 <db7570cb-8f63-b551-d119-c54270ce6139@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db7570cb-8f63-b551-d119-c54270ce6139@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 24 Oct 2018, Jae Hyun Yoo wrote:
> On 10/24/2018 3:59 AM, Lee Jones wrote:
> > On Tue, 18 Sep 2018, Jae Hyun Yoo wrote:
> > 
> > > This commit adds PECI client MFD driver.
> > > 
> 
> <snip>

[...]

> > > +bool peci_temp_need_update(struct temp_data *temp)
> > > +{
> > > +	if (temp->valid &&
> > > +	    time_before(jiffies, temp->last_updated + UPDATE_INTERVAL))
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +EXPORT_SYMBOL_GPL(peci_temp_need_update);
> > > +
> > > +void peci_temp_mark_updated(struct temp_data *temp)
> > > +{
> > > +	temp->valid = 1;
> > > +	temp->last_updated = jiffies;
> > > +}
> > > +EXPORT_SYMBOL_GPL(peci_temp_mark_updated);
> > 
> > These are probably better suited as inline functions to be placed in
> > a header file.  No need to export them, since they only use their own
> > data.

Also move them into the HWMON header file.

They have no business in MFD.

[...]

> > > +int peci_client_rd_pkg_cfg_cmd(struct peci_mfd *priv, u8 mbx_idx,
> > 
> > This is gobbledegook.  What's rd?  Read?
> > 
> 
> Yes, the 'rd' means 'read'. I intended to keep command names as listed
> in the PECI specification such as RdPkgConfig, WrPkgConfig and so on.
> Should I change it to 'peci_client_read_package_config_command' ?

I looks/reads a lot nicer, don't you think?

[...]

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
