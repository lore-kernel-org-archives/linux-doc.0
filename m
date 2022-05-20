Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA29C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 20 May 2022 14:25:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350260AbiETOZu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 May 2022 10:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238648AbiETOZs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 May 2022 10:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 26F0426D4
        for <linux-doc@vger.kernel.org>; Fri, 20 May 2022 07:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653056746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=LgaOPsgLzdGOybOGdbkt3eWCSmBp4eOj21SKd6XdJOaR991X0QuJeudbJ/Af8W+hZrHZjI
        yi63WSCyayVmb0ePidSaIGb8NBo/zoB4UxAvXjTG2ED/qOTgF94FC9+x2qTS/0M7W+RJVQ
        SBZPNDgzmr9WBnxtkILLM2VxzGRjWE8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-0PtWeGl-PVeo4WJC3z5LJQ-1; Fri, 20 May 2022 10:25:45 -0400
X-MC-Unique: 0PtWeGl-PVeo4WJC3z5LJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 535763C1E323;
        Fri, 20 May 2022 14:25:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 09E38C50941;
        Fri, 20 May 2022 14:25:43 +0000 (UTC)
From:   Paolo Bonzini <pbonzini@redhat.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-doc@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Suresh Warrier <warrier@linux.vnet.ibm.com>,
        Paul Mackerras <paulus@samba.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] KVM: powerpc: remove extraneous asterisk from rm_host_ipi_action comment
Date:   Fri, 20 May 2022 10:25:41 -0400
Message-Id: <20220520142541.3331516-1-pbonzini@redhat.com>
In-Reply-To: <20220506070747.16309-1-bagasdotme@gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Queued, thanks.

Paolo


