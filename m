Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 352F57D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 11 Sep 2018 06:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbeIKLsG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Sep 2018 07:48:06 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39352 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726483AbeIKLsG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 11 Sep 2018 07:48:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id EFB6040776F0;
        Tue, 11 Sep 2018 06:50:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-66.ams2.redhat.com [10.36.116.66])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 536DC2156889;
        Tue, 11 Sep 2018 06:50:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 8B55E16E08; Tue, 11 Sep 2018 08:50:14 +0200 (CEST)
Date:   Tue, 11 Sep 2018 08:50:14 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, linux-api@vger.kernel.org
Subject: Re: [PATCH v7] Add udmabuf misc device
Message-ID: <20180911065014.vo6qp6hkb7cjftdc@sirius.home.kraxel.org>
References: <20180827093444.23623-1-kraxel@redhat.com>
 <21053714.0Xa7F2u2PE@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21053714.0Xa7F2u2PE@avalon>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Tue, 11 Sep 2018 06:50:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Tue, 11 Sep 2018 06:50:16 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

  Hi,

> > +#define UDMABUF_CREATE       _IOW('u', 0x42, struct udmabuf_create)
> 
> Why do you start at 0x42 if you reserve the 0x40-0x4f range ?

No particular strong reason, just that using 42 was less boring than
starting with 0x40.

> > +#define UDMABUF_CREATE_LIST  _IOW('u', 0x43, struct udmabuf_create_list)
> 
> Where's the documentation ? :-)

Isn't it simple enough?

But, well, yes, I guess I can add some kerneldoc comments.

> > +static int udmabuf_vm_fault(struct vm_fault *vmf)
> > +{
> > +	struct vm_area_struct *vma = vmf->vma;
> > +	struct udmabuf *ubuf = vma->vm_private_data;
> > +
> > +	if (WARN_ON(vmf->pgoff >= ubuf->pagecount))
> > +		return VM_FAULT_SIGBUS;
> 
> Just curious, when do you expect this to happen ?

It should not.  If it actually happens it would be a bug somewhere,
thats why the WARN_ON.

> > +	struct udmabuf *ubuf;

> > +	ubuf = kzalloc(sizeof(struct udmabuf), GFP_KERNEL);
> 
> sizeof(*ubuf)

Why?  Should not make a difference ...

> > +		memfd = fget(list[i].memfd);
> > +		if (!memfd)
> > +			goto err_put_pages;
> > +		if (!shmem_mapping(file_inode(memfd)->i_mapping))
> > +			goto err_put_pages;
> > +		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
> > +		if (seals == -EINVAL ||
> > +		    (seals & SEALS_WANTED) != SEALS_WANTED ||
> > +		    (seals & SEALS_DENIED) != 0)
> > +			goto err_put_pages;
> 
> All these conditions will return -EINVAL. I'm not familiar with the memfd API, 
> should some error conditions return a different error code to make them 
> distinguishable by userspace ?

Hmm, I guess EBADFD would be reasonable in case the file handle isn't a
memfd.  Other suggestions?

I'll prepare a fixup patch series addressing most of the other
review comments.

cheers,
  Gerd

