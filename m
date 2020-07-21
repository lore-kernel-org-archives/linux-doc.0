Return-Path: <SRS0=huOA=BA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83026C433E2
	for <linux-doc@archiver.kernel.org>; Tue, 21 Jul 2020 20:58:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58B2B2068F
	for <linux-doc@archiver.kernel.org>; Tue, 21 Jul 2020 20:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mHdARhUT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728944AbgGUU6c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Jul 2020 16:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730304AbgGUU6b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Jul 2020 16:58:31 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A339C0619DD
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2020 13:58:31 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 207so39631pfu.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2020 13:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X52qI9IuX8ehsLxlnySnmok7XL1KtNCuLE+99FuZBeI=;
        b=mHdARhUTuiPaFxjw12aZ6Wa9+kLghKQ0fq8ZJpwVAledPTAoh2U3VGDsfsyr4CtWiS
         NXuH7AFqDcCmAepHllRQ4Wq6geSc5R3h6YB/TWlMfokX4+eEHRFZKFDVxGqrMiu2MRku
         91nIm/w9OxN3qHJykIwzJ//I2SrZPpLlqSXMiGkKwGrq7deQxUUahBBRIdBCDYalvXeO
         RXkwNN69nSl3vRbDjY12ItnzNxSn54y5LrsKUYN1XwkelXZrn2ofOPGVf1/ffcUuaa7h
         a83DRCCTf2xgI5VIfkzGeDM08SV43UCY0a72ArB/oCDawwpiJKf3+5B7lUPaBFF2NcE8
         0C2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X52qI9IuX8ehsLxlnySnmok7XL1KtNCuLE+99FuZBeI=;
        b=GZn/H1UjNg3RGeU0ZwA6ZJ7zcG/IR+QuPIGT7gvhRfUhISeFr9MYQpOfl6xZDmcVzH
         4GgSnXcDPZ6GvqBp1JH4+Nxg3it0f40l3pQhwL1K/ZkV/CgOyjSvCIDWLr1RfkVtSLWe
         xVH7vzcKplqP/erDaSHHmnRJEqF8oSq426J/J7ZRC2v5xiVRClBYNBGMrJP5czBrg+IG
         9ZCKX6ZsSypI9cJigb6VnJXCWLJGwcm2VumvNWJxxQJjBNSKkghtu4emwExnvfbRVmul
         V/lZKx9zGOH0VSLQ/ZpapbNSvtF1nr7lqMqkkLWvRhY1SUzmf3HSsi7FGVZnBf2yegEF
         aNlQ==
X-Gm-Message-State: AOAM531UclJUrHr0iX8IC8ZO52ONd4pRCiV9k+hhwVf0FnJOZFIZV283
        7uIgzoLktCxEoWxHISVIR1MVXw==
X-Google-Smtp-Source: ABdhPJzipImp2FJDXR65FI4cQBfU1/ZWv6fskJvunQo3KeiwYFfoMSTrdro0BQYaNbHlwWG5ksZP1g==
X-Received: by 2002:a63:c049:: with SMTP id z9mr19741380pgi.353.1595365110347;
        Tue, 21 Jul 2020 13:58:30 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z25sm21277934pfg.140.2020.07.21.13.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 13:58:29 -0700 (PDT)
Date:   Tue, 21 Jul 2020 13:56:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>, agross@kernel.org,
        ohad@wizery.com, corbet@lwn.net, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] remoteproc: Add remoteproc character device
 interface
Message-ID: <20200721205635.GM2922385@builder.lan>
References: <1594148870-27276-1-git-send-email-sidgup@codeaurora.org>
 <1594148870-27276-2-git-send-email-sidgup@codeaurora.org>
 <20200715201839.GA3204081@xps15>
 <20200715215149.GA3267350@xps15>
 <81d7514c-727e-b4dc-e4ac-74a25966ccaf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81d7514c-727e-b4dc-e4ac-74a25966ccaf@codeaurora.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue 21 Jul 12:16 PDT 2020, Siddharth Gupta wrote:
> On 7/15/2020 2:51 PM, Mathieu Poirier wrote:
> > On Wed, Jul 15, 2020 at 02:18:39PM -0600, Mathieu Poirier wrote:
> > > On Tue, Jul 07, 2020 at 12:07:49PM -0700, Siddharth Gupta wrote:
[..]
> > > > diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
[..]
> > > > +int rproc_char_device_add(struct rproc *rproc)
> > > > +{
> > > > +	int ret;
> > > > +	dev_t cdevt;
> > > > +
> > > > +	cdev_init(&rproc->char_dev, &rproc_fops);
> > > > +	rproc->char_dev.owner = THIS_MODULE;
> > > > +
> > > > +	cdevt = MKDEV(rproc_major, rproc->index);
> > > > +	ret = cdev_add(&rproc->char_dev, cdevt, 1);
> > Trying this patchset on my side gave me the following splat[1].  After finding
> > the root case I can't understand how you haven't see it on your side when you
> > tested the feature.
> > 
> > [1]. https://pastebin.com/aYTUUCdQ

Mathieu, I've looked at this back and forth. Afaict this implies that
rproc_major is still 0. Could it be that either alloc_chrdev_region()
failed or somehow has yet to be called when you hit this point?

> Hey Mathieu,
> 
> We aren't able to reproduce the error that you are seeing, the splat is
> coming
> from the check for whiteout device[1] - which shouldn't happen because of
> the
> find_dynamic_major call[2], right?
> 
> We are successfully seeing all our character device files and able to
> successfully boot remoteprocs. From what I read and understood about
> whiteout
> devices they will be hidden in the fs.
> 
> Could you provide more details about your configuration and testing?
> 
> [1]: https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L486
> <https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L123>
> [2]: https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L123
> 
> <https://github.com/torvalds/linux/blob/master/fs/char_dev.c#L486>
> > > > +	if (ret < 0)
> > > > +		goto out;
> > > > +
> > > > +	rproc->dev.devt = cdevt;
> > > > +out:
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +void rproc_char_device_remove(struct rproc *rproc)
> > > > +{
> > > > +	__unregister_chrdev(rproc_major, rproc->index, 1, "remoteproc");
> > > > +}
> > > > +
> > > > +void __init rproc_init_cdev(void)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret = alloc_chrdev_region(&rproc_major, 0, NUM_RPROC_DEVICES, "remoteproc");
> > > > +	if (ret < 0)
> > > > +		pr_err("Failed to alloc rproc_cdev region, err %d\n", ret);
> > > > +}
> > > > +
> > > > +void __exit rproc_exit_cdev(void)
> > > > +{
> > > > +	unregister_chrdev_region(MKDEV(rproc_major, 0), NUM_RPROC_DEVICES);
> > > Please go back to the comment I made on this during my last review and respin.
> > After digging in the code while debugging the above problem, I don't see how
> > unregistering the chrdev region the way it is done here would have worked.
> Since this is compiled statically and not built as a module, we will never
> exercise the code path, so I will remove it in the next patchset.
> 

You're right Siddharth, since we changed CONFIG_REMOTEPROC to bool it's no longer
possible to hit remoteproc_exit(), so you can omit this function
entirely. (And we should clean up the rest of that as well)

[..]
> > > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
[..]
> > > > @@ -488,6 +489,8 @@ struct rproc_dump_segment {
> > > >    * @auto_boot: flag to indicate if remote processor should be auto-started
> > > >    * @dump_segments: list of segments in the firmware
> > > >    * @nb_vdev: number of vdev currently handled by rproc
> > > > + * @char_dev: character device of the rproc
> > > > + * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> > > >    */
> > > >   struct rproc {
> > > >   	struct list_head node;
> > > > @@ -523,6 +526,8 @@ struct rproc {
> > > >   	int nb_vdev;
> > > >   	u8 elf_class;
> > > >   	u16 elf_machine;
> > > > +	struct cdev char_dev;

As stated privately, I assumed based on this name that this is a struct
device related to that character device. So please rename this cdev to
save me from doing this mistake again.

Thanks,
Bjorn
