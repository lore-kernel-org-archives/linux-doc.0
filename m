Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0DFDA7D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Feb 2019 20:28:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfBFU2g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Feb 2019 15:28:36 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42321 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726022AbfBFU2g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Feb 2019 15:28:36 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 65C3821C48;
        Wed,  6 Feb 2019 15:28:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 06 Feb 2019 15:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=date
        :from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=TTWvcmZyfjNMBXBOqsgqUg3LojQ
        3JNdyJr4S/FFW1lY=; b=OEM1qlWNY6OrdawOX7F+TwnDkLncWe/FnPKJAWpqagM
        C6hoCd2gnPw9iiVzNsrC3ehXl9z2yKHOf5kf+vlmiE6JFAh+9nZgjLGEYwNZ9iCU
        NjyzT70dwmsTHVuvRUUFUoVUBNbDbGFHD9VdeHD624jKfZwhZxKB79d/PMHBzLli
        apMHomoIq7TUD4ksAVThaxkYzh/625XnyCB87WGq03ezLBr2FVyxp2EcDxNkZb23
        piRd6d2i539hYlBi8TyVtGzS+eXFVsnADCoA7D9PWucsxlM/MUFeR4oQIJbFn4w4
        9j7ePUvhZnqU5Dzf7SYE5aC9xJZdL349NcmVQse8h9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TTWvcm
        ZyfjNMBXBOqsgqUg3LojQ3JNdyJr4S/FFW1lY=; b=BlitvqDfvUWJ0INHq7xhs2
        32Cd9xy/MPrE63X2Vw9gQ/jcSNFHel98G8kI7coqu5k3oA1Qo3G/7F6Cemly4/xW
        rQ4IsPKAAnSFRjU9vpaoKfq4Od5oABV9mvB7uCoMOv2WhjIDOxBaJuBGh6/r/sZz
        u4Y82GAn5MG8e8Ko77WzVXHLEiRvm4Dz+B5n/o7rZDi2p11eK1mLRntib4KM5kIN
        JUcSam6AnlFj7rLLfOtAvt4vrnT6c/MKJvyYltsiWrr7KLkMhyAUH+wh0pKSzBb+
        gqgwjh/dEHFAadkVQ+/+fQndGWRsgv/QnqrryfKhzibS8VBRBOMBgNlGC9wIQCqw
        ==
X-ME-Sender: <xms:ckNbXPl4_4Nr2yglZbvTk1K4SPe3bZH2xfLAqTqhd1lgMVYVk_tBMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrkeekgddugedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
    tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddutd
    dmnecujfgurhepfffhvffukfhfgggtuggjofgfsehttdertdforedvnecuhfhrohhmpedf
    vfhosghinhcuvedrucfjrghrughinhhgfdcuoehmvgesthhosghinhdrtggtqeenucffoh
    hmrghinhepkhgvrhhnvghlrdhorhhgpdhsphhhihhngidqughotgdrohhrghdpshhouhhr
    tggvfhhorhhgvgdrnhgvthenucfkphepuddvuddrgeegrddvvdeirddujeelnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmvgesthhosghinhdrtggtnecuvehluhhsthgvrhfuihii
    vgeptd
X-ME-Proxy: <xmx:ckNbXIDGQFbZc82fo1o0AFR20wjt7MG_a4uTYmZnivz9NeYJ59Oa6w>
    <xmx:ckNbXGiCo8qqxrDSgVyDruNNmqBphA9dJldumL05TVlWVOxnzINJ5Q>
    <xmx:ckNbXNxGaxk_L8n_1Wvsrj-6B6MbSF-hVAWaX6OKpTR0X6v1hUER5g>
    <xmx:c0NbXOjn-qMvgepyI_W1NlyNwTv-Rtuwdyg5h0Gczv7zMFW4t_XIUg>
Received: from localhost (ppp121-44-226-179.bras2.syd2.internode.on.net [121.44.226.179])
        by mail.messagingengine.com (Postfix) with ESMTPA id C2F16E4210;
        Wed,  6 Feb 2019 15:28:33 -0500 (EST)
Date:   Thu, 7 Feb 2019 07:28:29 +1100
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Rapoport <rppt@linux.ibm.com>,
        "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] docs: Use underscore not hyphen in label
Message-ID: <20190206202829.GC24938@eros.localdomain>
References: <20190131040623.15569-4-me@tobin.cc>
 <20190131092757.GF28876@rapoport-lnx>
 <20190131205608.GB1329@eros.localdomain>
 <20190201160310.5b98eb69@lwn.net>
 <20190202143209.GA8620@rapoport-lnx>
 <20190204211220.GA8601@eros.localdomain>
 <20190204160336.12fe82f6@lwn.net>
 <c19a1a84-72cd-407a-f4f1-180c5b0d4bf0@darmarit.de>
 <20190206042755.GC16761@eros.localdomain>
 <c4ee1d24-6a14-d87f-3a0c-88b13e56590f@darmarit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4ee1d24-6a14-d87f-3a0c-88b13e56590f@darmarit.de>
X-Mailer: Mutt 1.11.3 (2019-02-01)
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 06, 2019 at 08:49:38AM +0100, Markus Heiser wrote:
> Am 06.02.19 um 05:27 schrieb Tobin C. Harding:
> > Seems we either change them all or none of them.
> 
> Both are OK .. from the spec ...
> 
> "Simple reference names are single words consisting of alphanumerics plus
> isolated (no two adjacent) internal hyphens, underscores, periods, colons
> and plus signs; no whitespace or other characters are allowed." [1]
> 
> 
> >> Many errors are not reported again in rebuilds.
> >
> > It's more than that.  Seems that no .o files means dependencies are not
> > the same in docs directories to *usual* source code directories, as in
> > this example, a file with an outdated label was not rebuilt since it
> > wasn't touched.
> 
> Right, this is what they call the 'doctree' files (see [2] for build
> phases), one for every source file.  ATM they are located in the hidden
> folder 'output/.doctree'.  OT here, just to mentioning: this will result in
> the folder being exported at the end, e.g. kernel.org:
> 
>   https://www.kernel.org/doc/html/latest/.doctrees/
> 
> > Note to self, always do clean build for docs patches.  Thanks.
> >
> >> To reproduce this error run 'make cleandocs htmldocs' first.  Then you will see
> >> this error message (I'am on current docs-next from Jon using Sphinx v1.8.3 ):
> >>
> >>    Documentation/core-api/mm-api.rst:22: WARNING: undefined label: \
> >>      memory-allocation (if the link has no caption ...)
> >
> > Can confirm I also get this warning,
> ..
> > With patch reverted, on docs-next, I've got 0 'undefined labels'
> > warnings.
> 
> Thanks for verification.
> 
> [1] http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#reference-names
> [2] http://www.sphinx-doc.org/en/master/extdev/index.html#build-phases
> 
> 
>  -- Markus --
> 

Thanks Markus, I appreciate the information.


	Tobin.
