Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC94C4743E
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 15:26:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D687F61246
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 15:26:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhFHP2V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 11:28:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37918 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230458AbhFHP2S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 11:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623165985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Dons6tltBqQZH2QeFOcvai/iidvFY4QSS28eS4paeyM=;
        b=N6kZfFfH2TibCeqDUnF3XQMDAB1CkfUVA7zx53io4NyTH+PVDF3xBY9oTt33P+NLFQ7dcA
        7sjgVxqufsn94yyzZdljSlZzox+ZjG1qcPpXN8w9nzctquhB8jz9xwgCEN80ZBKnGngRXN
        y19PFCEXw9BXP2oPPeZqCJftUwDsA9k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-L5r9p8P_NomdQCdSiUOD0w-1; Tue, 08 Jun 2021 11:26:23 -0400
X-MC-Unique: L5r9p8P_NomdQCdSiUOD0w-1
Received: by mail-wr1-f72.google.com with SMTP id u20-20020a0560001614b02901115c8f2d89so9520973wrb.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 08:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Dons6tltBqQZH2QeFOcvai/iidvFY4QSS28eS4paeyM=;
        b=aT40S/K7lf2qtq/R57fIumZgIQjiCyyODxgPrkLnKULWvtlckpxEdLliVZ7ZEJMLFV
         Hf2xW1l6Nolfh0+cFFWwAILwRaGPD3hX9ZJdKiUSfHoU1pNZESuT/kRRI5Rn2eVmHKRi
         5bPCYdWLKh0bokm/acHSXsfEhmC/ByDoisHRWxMBfdBOjflQceyC68u/Bw/jOS2c45qz
         uucfE3uoINKFcVSILRtuz/VrGGDRcKw8bwqRkT07fYFabVISLsoPwbYaQh0IChmzR1E6
         ZU4vC8qN6CwgsvPTpH5CWusampSFc+LXLvcOrQ/uLnXSEnxZLX7bSyCzUwTbQ7/oKcor
         ai8Q==
X-Gm-Message-State: AOAM531wxJ9IaAAo4L/KbHPKXITjh8v+1I4uCfzf8sW7GaKxxz9Rim+g
        a3WoLKRACA+PNx8H/SKO2Ua84Fx1RTxkxD/BHu/AZEidi6eywkPl43x9uWThg5dDQ5aaG5jLfqP
        w7UQExvZj9A3h3gm12M0MEOvmJHa++GfLnd8l2unxXKx2lJMUTAAMZgfujZ6fOfu+NyTw
X-Received: by 2002:a5d:6111:: with SMTP id v17mr13460440wrt.20.1623165982742;
        Tue, 08 Jun 2021 08:26:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOjgIg8iLQVnuaD504Axjb8TEod5Dwy+jHIuka6fqtUEQ8Kj0bM5dyezq9BOoxSDxPTKFL2A==
X-Received: by 2002:a5d:6111:: with SMTP id v17mr13460418wrt.20.1623165982551;
        Tue, 08 Jun 2021 08:26:22 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c61cf.dip0.t-ipconnect.de. [91.12.97.207])
        by smtp.gmail.com with ESMTPSA id h46sm23589783wrh.44.2021.06.08.08.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 08:26:22 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] memory-hotplug.rst: complete admin-guide overhaul
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        Muchun Song <songmuchun@bytedance.com>,
        Oscar Salvador <osalvador@suse.de>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-doc@vger.kernel.org
References: <20210608133855.20397-1-david@redhat.com>
 <20210608133855.20397-3-david@redhat.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <c13a08c1-723e-fa83-d02c-68ad0733231a@redhat.com>
Date:   Tue, 8 Jun 2021 17:26:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608133855.20397-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08.06.21 15:38, David Hildenbrand wrote:
> The memory hot(un)plug documentation is outdated and incomplete. Most of
> the content dates back to 2007, so it's time for a major overhaul.
> 
> Let's rewrite, reorganize and update most parts of the documentation. In
> addition to memory hot(un)plug, also add some details regarding
> ZONE_MOVABLE, with memory hotunplug being one of its main consumers.
> 
> Drop the file history, that information can more reliably be had from
> the git log.
> 
> The style of the document is also properly fixed that e.g., "restview"
> renders it cleanly now.
> 
> In the future, we might add some more details about virt users like
> virtio-mem, the XEN balloon, the Hyper-V balloon and ppc64 dlpar.
> 
> Acked-by: Michal Hocko <mhocko@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Muchun Song <songmuchun@bytedance.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: David Hildenbrand <david@redhat.com>


After a follow-up discussion on v1, the following on top:

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index 353b67e76439..15330ad4b764 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -35,7 +35,7 @@ used to expose persistent memory, other performance-differentiated memory and
  reserved memory regions as ordinary system RAM to Linux.
  
  Linux only supports memory hot(un)plug on selected 64 bit architectures, such as
-x86_64, aarch64, ppc64, s390x and ia64.
+x86_64, arm64, ppc64, s390x and ia64.
  
  Memory Hot(Un)Plug Granularity
  ------------------------------
@@ -178,9 +178,9 @@ Or one can explicitly request a kernel zone (usually ZONE_NORMAL) by::
  
         % echo online_kernel > /sys/devices/system/memory/memoryXXX/state
  
-In any case, if offline succeeds, the state of the memory block is changed to be
-"online". If it fails, an error will be returned by the kernel via the system
-call that triggered the respective file modification.
+In any case, if onlining succeeds, the state of the memory block is changed to
+be "online". If it fails, the state of the memory block will remain unchanged
+and the above commands will fail.
  
  Onlining Memory Blocks Automatically
  ------------------------------------
@@ -234,8 +234,15 @@ Or alternatively::
  
         % echo 0 > /sys/devices/system/memory/memoryXXX/online
  
-If offline succeeds, the state of the memory block is changed to be "offline".
-If it fails, an error will be returned by the kernel.
+If offlining succeeds, the state of the memory block is changed to be "offline".
+If it fails, the state of the memory block will remain unchanged and the above
+commands will fail, for example, via::
+
+       bash: echo: write error: Device or resource busy
+
+or via::
+
+       bash: echo: write error: Invalid argument
  
  Observing the State of Memory Blocks
  ------------------------------------
@@ -535,7 +542,7 @@ block might fail:
    offlining; this applies to memory blocks present during boot only.
  
  - Special memory blocks prevented by the system from getting offlined. Examples
-  include any memory available during boot on aarch64 or memory blocks spanning
+  include any memory available during boot on arm64 or memory blocks spanning
    the crashkernel area on s390x; this usually applies to memory blocks present
    during boot only.
  




-- 
Thanks,

David / dhildenb

