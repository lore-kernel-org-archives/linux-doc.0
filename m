Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 426E87D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Oct 2019 16:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390200AbfJ2QJo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Oct 2019 12:09:44 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:32829 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390165AbfJ2QJo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Oct 2019 12:09:44 -0400
Received: by mail-pf1-f196.google.com with SMTP id c184so9930560pfb.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2019 09:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=41WzDpMSF4wbakSnRAo+F6FO20ZCJck01ia2byYk9RE=;
        b=lCZKBM4xRqcH05OrkSTKu+yOzb2ojbnVj4gdoRG+7mfJ2W3YlVR1hUf31TFfnv8fBq
         Jr0DhbupUr1lVfvpEGUdpkA6WSJru4M7lV0HT0FimK+EgTa2ungw8Yb6cDaTo3TPjqLP
         7bf1Ly53KJGXVc/z1s2jpH+8eaRYmVZaXKAIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=41WzDpMSF4wbakSnRAo+F6FO20ZCJck01ia2byYk9RE=;
        b=Z+FhrPJQ64C8qjefWAnNHe8NsPLBQ3yx24xAAXlM/pTH66dwLz7K7HFWtUtbt05w2N
         ZuHuqxo01m52IofGyqE4FRCukHtHX8cfJnNRloQVE32iaqgwVnXGWMpd8yNI6zZjVNV6
         MRQ5cVZr1ytlKlBl3sz+GXUhYjKR9ImnWx+VZFjCX9O0Kgxwb0CBvHvlI2NrDNypxpiB
         YC7x6ez45ovxDLeI716UBwGCKNj18OqIbLwlhWOJQVToWm9uQNvafKCqAzPTaggDv43Q
         G6CzE0JNcvIYPtZuTY9nPD2BeOm0CTCBQ3uKddJ8e/iEsrEh18XrNYdR/H9JvRui2HMJ
         d7dw==
X-Gm-Message-State: APjAAAUyXe0vhZlHPLgiCjdKVoS5qENA3XIOhxwv53nxN5JHCmgBtP4K
        H/IVrva8qKrIOvOAwjevqwn4gQ==
X-Google-Smtp-Source: APXvYqyoWdsYlzBLmI+26xS7OncfBbjI6+KPvDnbNa/dWk7WULh9MQxEN7UwEfVD1FQeoJl5goUORw==
X-Received: by 2002:a17:90a:25aa:: with SMTP id k39mr7631594pje.123.1572365382553;
        Tue, 29 Oct 2019 09:09:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 74sm1901758pfv.66.2019.10.29.09.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:09:41 -0700 (PDT)
Date:   Tue, 29 Oct 2019 09:09:40 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx parallel build errors
Message-ID: <201910290908.DA0B31031@keescook>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
 <201910091929.0C058BB@keescook>
 <20191010124832.23bc4362@lwn.net>
 <c6263597-e9d0-5a1f-effd-d1706c24e666@infradead.org>
 <8305ffe2-51ba-eb4b-4d44-2defe45aa68f@infradead.org>
 <20191027121729.59c1d539@lwn.net>
 <c0be66ed-eb97-bc19-5bdb-0ef8903c3709@infradead.org>
 <20191027160507.6d7be266@coco.lan>
 <201910281205.DD5B74F@keescook>
 <205d5664-88b9-36d4-75f3-67b51884bbda@darmarit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <205d5664-88b9-36d4-75f3-67b51884bbda@darmarit.de>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 29, 2019 at 09:16:06AM +0100, Markus Heiser wrote:
> @Kees: why did you mentioning MAINTAINERS parsing .. did you observe anything
> strange?

No, nothing strange exactly, but it was another change that happened
around the same time and is a pretty large parse. So I was wondering if
adding it might have tipped the scale.

-- 
Kees Cook
