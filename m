Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 138477D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 20:56:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbfAaU40 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Jan 2019 15:56:26 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:52635 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727077AbfAaU40 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Jan 2019 15:56:26 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id D22ED1725;
        Thu, 31 Jan 2019 15:56:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 31 Jan 2019 15:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=date
        :from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=NYsejD1oPcQrsh18xoYQOs23rVh
        TPkTtxPQQscPNQ8Q=; b=sCjMbBtEdLxDo/2dD9sT7rjzWhRVjRudDq5VuN2JK33
        45DtaXfyQZARKa7+uiIzcg/C3SMyqIlo8GS73vbTiwu3QNHmJWsbxm4GIXcm4NDC
        sHYk9Ilt3MlV2ELNbaxBiQrE8q6hLSn+xjkhWg/XRBSJzWzi5Knmk5YM8cAli0I8
        tInzVxaKxT6KEklY+BKn4Q3zW2AFP9NGg/yrRAyNpXknoAJ38CqVk3kXMguoxTiA
        ujhrqmZMwTk2p4/hYJtf5V+AS4bCGPZigyst0Hs3d/90WPHnZOGH3rOr1dJX/moT
        53oyt+obOAjZRygJgbrK/0GypXXXaAJtmbtAJqGpdjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NYsejD
        1oPcQrsh18xoYQOs23rVhTPkTtxPQQscPNQ8Q=; b=DTTj7t6pFDXx41TsKac8BJ
        K7PFpnGLJiuYQAgLg13xNxQ8H1SAJ8XOgAs8g8PSpXKAazETVDoK4fZ6qkuDBckC
        lMoo+kTHp7elzLE/IZ+T3zj0AiF+45tvDHKmQJ4o34AgUZLVQzcyqD+ER0NHQPOc
        payqAOI4w2aBfyZFj4LdmlQcwF4lNZbLwR7EvNOOjylNGsg/4HN7SVGGQrs02HpH
        Vrek4Y8AE/f24RwpuAee3yy1Gm2Bl5Sy7A4RWTRq1RIZ27r++O42iV6jkagLMtZh
        T9v+0ukS+aW/OO/rAnZKm1asfwyVTpYjKL0XaBCkwc3HAgpqOEFY5SGqC4myJR6g
        ==
X-ME-Sender: <xms:92BTXCtfYs4Zj9jrDQpqe4GWwcT5ZTjySQBCq5pKN_8vNjmyEtzcnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjeeigddugeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
    tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdeftd
    dmnecujfgurhepfffhvffukfhfgggtuggjofgfsehttdertdforedvnecuhfhrohhmpedf
    vfhosghinhcuvedrucfjrghrughinhhgfdcuoehmvgesthhosghinhdrtggtqeenucffoh
    hmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvddurdeggedrvddvjedrudehjeen
    ucfrrghrrghmpehmrghilhhfrhhomhepmhgvsehtohgsihhnrdgttgenucevlhhushhtvg
    hrufhiiigvpedt
X-ME-Proxy: <xmx:92BTXD2n54e6Jyi2WmSDsXelNuURLMgA1axPPwAKevP3Zt-_jQR61A>
    <xmx:92BTXCOU2lKsOLiaWA143UqU6bpHR6bzc6TWFp00Y4YplTZuwm6VvQ>
    <xmx:92BTXLWZoRnezvMgm3x4sOLGUdf2ei9r-IUuWOROrN4uuadiuIHTzA>
    <xmx:-GBTXCDYC1CWC4evUS_nvAxWDIgYQXnGs1jKq3EWWtZeJe_VQbCU7w>
Received: from localhost (ppp121-44-227-157.bras2.syd2.internode.on.net [121.44.227.157])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1B9B3100BA;
        Thu, 31 Jan 2019 15:56:21 -0500 (EST)
Date:   Fri, 1 Feb 2019 07:56:08 +1100
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Mike Rapoport <rppt@linux.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] docs: Use underscore not hyphen in label
Message-ID: <20190131205608.GB1329@eros.localdomain>
References: <20190131040623.15569-1-me@tobin.cc>
 <20190131040623.15569-4-me@tobin.cc>
 <20190131092757.GF28876@rapoport-lnx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190131092757.GF28876@rapoport-lnx>
X-Mailer: Mutt 1.11.2 (2019-01-07)
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 31, 2019 at 11:27:57AM +0200, Mike Rapoport wrote:
> On Thu, Jan 31, 2019 at 03:06:23PM +1100, Tobin C. Harding wrote:
> > From: "Tobin C. Harding" <tobin@kernel.org>
> > 
> > sphinx emits warning
> > 
> >        WARNING: undefined label: memory-allocation ...
> 
> Weird, for me it works fine. The generated html at kernel.org [1] also
> seems to be Ok...
> 
> What version of sphinx do you use?

Thanks for looking at this Mike.  I was running 1.4, I see there is a v2
out so I'll upgrade but if the warning doesn't show for you then I'd say
we just drop this patch.

Jon,

Is it within your usual workflow to take just the first two patches from
this series or would you like me to spin another version without the
final patch in it?


thanks,
Tobin.
