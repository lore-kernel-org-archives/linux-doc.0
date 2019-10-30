Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D70B77D918
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 Oct 2019 16:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfJ3QC5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Oct 2019 12:02:57 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37619 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbfJ3QC5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Oct 2019 12:02:57 -0400
Received: by mail-pg1-f194.google.com with SMTP id p1so1778247pgi.4
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2019 09:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=VoUHDBkMmd0HSBoZsz/ANMDge7dtZlxy+cPZi/mFFJY=;
        b=Kwx+ej5rUUdH05bGpgZpyIashKuG83SmcQrnDsm+0lkzjNj+a/z/2AYj955t9lDk5J
         wM9pSqdj/pjkJ/9fqeY9vJA4+RepNJgc0XpETFOyHjZO784yLooJUr0S5S0azRi1xVCK
         2npjQfJ7X7m5p+lT7hDQY7pxd7Hua4CD2zHNc1ilftvalB1GC9rxo0gSKg0jCBdKBn72
         OTh7uP80F4rVatHRyeUPyZLMukEb62PvTqWNWARYt5PlbtxBy047yW0RiVnUHkzfbCml
         0A9j5I62awVLtlW+2u7tjzfUrlwNFmqhQFW354VvHwHwdWDOJT7OZ7P21G5h7AJcmnFp
         jKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=VoUHDBkMmd0HSBoZsz/ANMDge7dtZlxy+cPZi/mFFJY=;
        b=o7Fr0X8euIhhNZ8WUdVg+JgIqxI+N5B6QjdDbiJm3oj0z4Kcr9lwD9z4BSeJRV0DzC
         DzU+xjHa6O4GfMX3c/L+Hk1CSR2q6i3KyW1LTyJo5rFBWUhIBm0sCkzfFijXEGC8u3Oy
         gvWJemf2LdxtVlhmTWNk22dIYPb6F1e7Cus1uuIGUVnvC8upJG4cCjwYdk9T/S4N6Ccj
         x8VsL1mfgMH+jnYA5N0oeyn653wP86/PA4RopLQPAFIW3JxYVLsmGR65XZ3XII/aKVQ4
         ++hWOsA+UjnRZxg0/ZwEV0F3Pi1kgA6xPuJLbqNmdqNXbOPl/BOlhodumqa+RSbu4mi0
         h2Aw==
X-Gm-Message-State: APjAAAVWs5//jiWgsOPjM2zn0AX8iXSQvIlkVYyBYDsRWBxhc+FZda5j
        tn1t27qzrR9LRJhKlUdkRoXpwA==
X-Google-Smtp-Source: APXvYqwKh2sNDkMWVEr8EZeiQYcDxBUIyGbXfa1wOACGtQkqflx1gjxVl6QWK3rDAjeFaaWgdy3PMg==
X-Received: by 2002:a17:90a:db47:: with SMTP id u7mr14678517pjx.3.1572451376075;
        Wed, 30 Oct 2019 09:02:56 -0700 (PDT)
Received: from cakuba.hsd1.ca.comcast.net (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id 3sm366984pfh.45.2019.10.30.09.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 09:02:55 -0700 (PDT)
Date:   Wed, 30 Oct 2019 09:02:52 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     davem@davemloft.net, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        Simon Horman <simon.horman@netronome.com>
Subject: Re: [PATCH net] Documentation: netdev-FAQ: make all questions into
 headings
Message-ID: <20191030090252.7eedec35@cakuba.hsd1.ca.comcast.net>
In-Reply-To: <20191030024430.719c73be@lwn.net>
References: <20191029171215.6861-1-jakub.kicinski@netronome.com>
        <20191030024430.719c73be@lwn.net>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 30 Oct 2019 02:44:30 -0600, Jonathan Corbet wrote:
> On Tue, 29 Oct 2019 10:12:15 -0700
> Jakub Kicinski <jakub.kicinski@netronome.com> wrote:
> > -Q: I see a network patch and I think it should be backported to stable.
> > ------------------------------------------------------------------------
> > -Q: Should I request it via stable@vger.kernel.org like the references in
> > -the kernel's Documentation/process/stable-kernel-rules.rst file say?
> > +Q: I see a network patch and I think it should be backported to stable. Should I request it via stable@vger.kernel.org like the references in the kernel's Documentation/process/stable-kernel-rules.rst file say?
> > +------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
> 
> I don't think that making these massive heading lines actually improves the
> experience - for readers of either the plain-text or formatted docs.  If
> you really want to create headings, the heading here should be "Stable
> backports" or some such with the question appearing below.  But do the
> questions really need to be headings?

I agree that this is suboptimal. I couldn't come up with a better way
of handling this. I think consistently formatting all questions in one
way and answers in another make the document far easier to interpret.
I had hard time follow the current formatting:

https://www.kernel.org/doc/html/latest/networking/netdev-FAQ.html#q-i-have-created-a-network-patch-and-i-think-it-should-be-backported-to-stable

Is there a more appropriate form of emphasis we could use here? Even
if we add independent headings questions should remain emphasised
_somehow_ I reckon..
