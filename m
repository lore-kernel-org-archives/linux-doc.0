Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734A7C54EAA
	for <linux-doc@archiver.kernel.org>; Fri, 27 Jan 2023 16:08:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbjA0QH6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Jan 2023 11:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233599AbjA0QH6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Jan 2023 11:07:58 -0500
X-Greylist: delayed 574 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 27 Jan 2023 08:07:55 PST
Received: from out-158.mta0.migadu.com (out-158.mta0.migadu.com [91.218.175.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCA62068E
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 08:07:52 -0800 (PST)
Message-ID: <a4b3ee35-a0d7-80f6-c64f-f9056c5b6110@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1674835097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gvi6m70GbKqrQkpAzMUr7WtmhWXUZdYOPES9ccn9egI=;
        b=KRE4nOsctuEOl2LC2RDrgOWHYDOICSl9b3eAwTINeDAKX61JelkAi9iTzhDSLN6i0N4x/C
        8V/akap4D9bywbnfxgFBx/MT1rGL7DIrtaCptD2OExsatEpXKZ+6pjRJFX1M9/SrT2CaWU
        v98jc0dGUQ1VNvLSaosQbnwToi+t2Xs=
Date:   Fri, 27 Jan 2023 23:57:40 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/4] KVM: arm64: Add helper vgic_write_guest_lock()
Content-Language: en-US
To:     Gavin Shan <gshan@redhat.com>, kvmarm@lists.linux.dev
Cc:     kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com,
        corbet@lwn.net, maz@kernel.org, james.morse@arm.com,
        suzuki.poulose@arm.com, oliver.upton@linux.dev,
        yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        yuzhe@nfschina.com, isaku.yamahata@intel.com, seanjc@google.com,
        ricarkol@google.com, eric.auger@redhat.com, renzhengeek@gmail.com,
        reijiw@google.com, shan.gavin@gmail.com
References: <20230126235451.469087-1-gshan@redhat.com>
 <20230126235451.469087-3-gshan@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20230126235451.469087-3-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[ just coming back from holiday, sorry for the late reply ]

On 2023/1/27 07:54, Gavin Shan wrote:
> Currently, the unknown no-running-vcpu sites are reported when a
> dirty page is tracked by mark_page_dirty_in_slot(). Until now, the
> only known no-running-vcpu site is saving vgic/its tables through
> KVM_DEV_ARM_{VGIC_GRP_CTRL, ITS_SAVE_TABLES} command on KVM device
> "kvm-arm-vgic-its". Unfortunately, there are more unknown sites to
> be handled and no-running-vcpu context will be allowed in these
> sites: (1) KVM_DEV_ARM_{VGIC_GRP_CTRL, ITS_RESTORE_TABLES} command
> on KVM device "kvm-arm-vgic-its" to restore vgic/its tables. The
> vgic3 LPI pending status could be restored. (2) Save vgic3 pending

We typically write it as "VGICv3".

> table through KVM_DEV_ARM_{VGIC_GRP_CTRL, VGIC_SAVE_PENDING_TABLES}
> command on KVM device "kvm-arm-vgic-v3".
> 
> In order to handle those unknown cases, we need a unified helper
> vgic_write_guest_lock(). struct vgic_dist::save_its_tables_in_progress
> is also renamed to struct vgic_dist::save_tables_in_progress.

How about renaming it to 'write_tables_in_progress' which would look a
bit more generic? The rest looks good to me.

Thanks,
Zenghui
