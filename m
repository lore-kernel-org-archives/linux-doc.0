Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 460307E279
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Apr 2018 10:53:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754677AbeDWKwe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Apr 2018 06:52:34 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:50308 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754861AbeDWKwb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Apr 2018 06:52:31 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 51072C7D;
        Mon, 23 Apr 2018 10:52:30 +0000 (UTC)
Date:   Mon, 23 Apr 2018 12:52:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Cartwright <juliac@eso.teric.us>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stef van Os <stef.van.os@prodrive-technologies.com>,
        Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 03/10] drivers/peci: Add support for PECI bus driver
 core
Message-ID: <20180423105224.GA1444@kroah.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-4-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180410183212.16787-4-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 10, 2018 at 11:32:05AM -0700, Jae Hyun Yoo wrote:
> +static void peci_adapter_dev_release(struct device *dev)
> +{
> +	/* do nothing */
> +}

As per the in-kernel documentation, I am now allowed to make fun of you.

You are trying to "out smart" the kernel by getting rid of a warning
message that was explicitly put there for you to do something.  To think
that by just providing an "empty" function you are somehow fulfilling
the API requirement is quite bold, don't you think?

This has to be fixed.  I didn't put that warning in there for no good
reason.  Please go read the documentation again...

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
