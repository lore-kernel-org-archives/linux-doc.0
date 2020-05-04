Return-Path: <SRS0=VNB8=6S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92F8C3A5A9
	for <linux-doc@archiver.kernel.org>; Mon,  4 May 2020 23:04:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B744E24974
	for <linux-doc@archiver.kernel.org>; Mon,  4 May 2020 23:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588633493;
	bh=v78zj3Xz0TH4+T2yR35IJ+jtGRfuesua/TbMqnsBPDk=;
	h=Date:From:To:Subject:List-ID:From;
	b=J+kUVbzpGC9p47Fs39WvqMdXz7YQdmMdsnkKi7DQA3rySlwzV6yWJMv74xiBL4rAD
	 aLS8Ln2X1TtdOsixxxnvZzdTNXaizjlnk5rI/NjgmSpUB+U5sCvpQdiY/cPp7iv/po
	 R7v2FAgaxRxCbWbIrixpcqlEYm+SjVtFf+zDHeqA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgEDXEx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 May 2020 19:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728059AbgEDXEx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 May 2020 19:04:53 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070BBC061A0E
        for <linux-doc@vger.kernel.org>; Mon,  4 May 2020 16:04:53 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id j2so196471qtr.12
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2020 16:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:mime-version
         :content-disposition;
        bh=CN7dkpQWB3aBDnnZe0xbv2U05HaJBPFtOaS8GMawV9c=;
        b=BMeqtkQBUdhfCDisdZZl71y0MQ0xHxIyQH7tz/Bsw372WdmS1VOCM3vnNRYt03Bkno
         fiuyB90W6s5hKam1IbHVlrBsXW4pYz1j9Dp9bl9yufrWWWiXUK/Zl/azuhUAYEESozLp
         6Ns6VVZVCiY95CHROQn679tKm6kwxgohyqgjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :mime-version:content-disposition;
        bh=CN7dkpQWB3aBDnnZe0xbv2U05HaJBPFtOaS8GMawV9c=;
        b=gNCSbWIhhfw2RvBQDbZo9xr8fMIDHf/8RFZK1SoFfMJRZhBQg0TP+RHfeV/TNLKh1t
         1rig2n0wfzv9XQQTYl64FLLpPPk+PbjqmcLMh+XWmVsZcPqlGG+U9SBBocBMga6xdXE2
         FpdIq2qUPRKRkaudSTAtisrQwZ8wQeY30cKPFU4fkbwjzPLU2GK1MHSQTs3WIGzYlLOg
         K2h8M2+Lltm/U5OWz5KI5YolXRP+KvXxrpe6GTmKKl52cR92CY6FH+81AtzcnRNAXQs+
         Atcz4w6s+61i0BWlFx1cp8gA3Ex/GVys+mwwhV0CUv0T0UGiKXBlMvk/ulnvdNaKvn78
         gWFQ==
X-Gm-Message-State: AGi0PubONj2emSsaShQJJ/5y4NarfEowWhtuQTft7LEOnFyJa6sKESu/
        qFqYm/A4z6Hp0g2OdXLZSnvD96c5CDo=
X-Google-Smtp-Source: APiQypK9JdzH2LgsceLh5Tc3+iA7mYQzftLZLHcbQJ7wNRl/2WC+MSXGQepYF8/lB9RVDLatZehrsg==
X-Received: by 2002:ac8:7758:: with SMTP id g24mr1528207qtu.85.1588633491835;
        Mon, 04 May 2020 16:04:51 -0700 (PDT)
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id o22sm183798qtm.90.2020.05.04.16.04.50
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 16:04:51 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Mon, 04 May 2020 19:04:49 -0400
Date:   Mon, 4 May 2020 19:04:49 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-doc@vger.kernel.org
Subject: docs.kernel.org convenience URL
Message-ID: <20200504230449.zwythgphse4y3v5v@chatter.i7.local>
Mail-Followup-To: linux-doc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, all:

I set up a convenience URL for kernel docs:

  docs.kernel.org

Toplevel redirects to https://www.kernel.org/doc/html/latest/, but you 
can get a specific version as well:

  docs.kernel.org/5.5

You can also do subpaths:

  docs.kernel.org/admin-guide/index.html
  docs.kernel.org/5.5/admin-guide/index.html

-K
