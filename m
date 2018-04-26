Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5100C7E22E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Apr 2018 20:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754239AbeDZU4F (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Apr 2018 16:56:05 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43962 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754228AbeDZU4E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Apr 2018 16:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rFF6hz4noi/N1YsSXjZU7hD8umezovIPdXnyLfAC4F4=; b=etjOo2WZFfy2s2WP0g+UipmaK
        UdbEdwvXuraa0w6QWSVhADNnfOMt7WK1yNmTyI0eTFmd3Hvp21iQqgQWd/JjxKv1ndsFOuRs673EN
        EznIP4zDoBGMIOUoDOmV+VS/1JlJWqrJIcl8lIqtSE/yYtxu22U2qW02OnGZpamGuvnvpCTJXu4GO
        jJ9Y06NVJt5f22I3pL6PR8OEllEm/z1xpsXY72G+y+N7i9E/l+miihCbVmksN4ADud+04SAprguL6
        CnQ5DpZN9PCNeZnV/rACZozNZZ40ivMwqstPOlz4dvElenIZNKMZombBQSFe82I4DNvMey4dUHJ/G
        ZNTCXJtCQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fBnvt-0006Fu-Pq; Thu, 26 Apr 2018 20:56:01 +0000
Subject: Re: [PATCH v4 1/2] perf: uncore: Adding documentation for ThunderX2
 pmu uncore driver
To:     Ganapatrao Kulkarni <ganapatrao.kulkarni@cavium.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Will.Deacon@arm.com, mark.rutland@arm.com,
        jnair@caviumnetworks.com, Robert.Richter@cavium.com,
        Vadim.Lomovtsev@cavium.com, Jan.Glauber@cavium.com,
        gklkml16@gmail.com
References: <20180425090047.6485-1-ganapatrao.kulkarni@cavium.com>
 <20180425090047.6485-2-ganapatrao.kulkarni@cavium.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7c8ff675-2b27-8e7b-f046-513b73f1ae5f@infradead.org>
Date:   Thu, 26 Apr 2018 13:55:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180425090047.6485-2-ganapatrao.kulkarni@cavium.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Just a few typo corrections...

On 04/25/2018 02:00 AM, Ganapatrao Kulkarni wrote:
> Documentation for the UNCORE PMUs on Cavium's ThunderX2 SoC.
> The SoC has PMU support in its L3 cache controller (L3C) and in the
> DDR4 Memory Controller (DMC).
> 
> Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni@cavium.com>
> ---
>  Documentation/perf/thunderx2-pmu.txt | 66 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/perf/thunderx2-pmu.txt
> 
> diff --git a/Documentation/perf/thunderx2-pmu.txt b/Documentation/perf/thunderx2-pmu.txt
> new file mode 100644
> index 0000000..9e9f535
> --- /dev/null
> +++ b/Documentation/perf/thunderx2-pmu.txt
> @@ -0,0 +1,66 @@
> +
> +Cavium ThunderX2 SoC Performance Monitoring Unit (PMU UNCORE)
> +==========================================================================
> +
> +ThunderX2 SoC PMU consists of independent system wide per Socket PMUs such
> +as Level 3 Cache(L3C) and DDR4 Memory Controller(DMC).
> +
> +It has 8 independent DMC PMUs to capture performance events corresponding
> +to 8 channels of DDR4 Memory Controller. There are 16 independent L3C PMUs
> +to capture events corresponding to 16 tiles of L3 cache. Each PMU supports
> +up to 4 counters.
> +
> +Counters are independent programmable and can be started and stopped

                independently

> +individually. Each counter can be set to sample specific perf events.
> +Counters are 32 bit and does not support overflow interrupt, they are

                           do not                    interrupt; they are


> +sampled at every 2 seconds. The Counters register access are multiplexed
> +across channels of DMC and L3C. The muxing(select channel) is done through
> +write to a Secure register using smcc calls.
> +
> +PMU UNCORE (perf) driver:
> +
> +The thunderx2-pmu driver registers several perf PMUs for DMC and L3C devices.
> +Each of the PMU provides description of its available events

        of the PMUs

> +and configuration options in sysfs.
> +	see /sys/devices/uncore_<l3c_S_X/dmc_S_X/>
> +
> +S is socket id and X represents channel number.
> +Each PMU can be used to sample up to 4 events simultaneously.
> +
> +The "format" directory describes format of the config (event ID).
> +The "events" directory provides configuration templates for all
> +supported event types that can be used with perf tool.
> +
> +For example, "uncore_dmc_0_0/cnt_cycles/" is an
> +equivalent of "uncore_dmc_0_0/config=0x1/".
> +
> +Each perf driver also provides a "cpumask" sysfs attribute, which contains a
> +single CPU ID of the processor which is likely to be used to handle all the
> +PMU events. It will be the first online CPU from the NUMA node of PMU device.
> +
> +Example for perf tool use:
> +
> +perf stat -a -e \
> +uncore_dmc_0_0/cnt_cycles/,\
> +uncore_dmc_0_1/cnt_cycles/,\
> +uncore_dmc_0_2/cnt_cycles/,\
> +uncore_dmc_0_3/cnt_cycles/,\
> +uncore_dmc_0_4/cnt_cycles/,\
> +uncore_dmc_0_5/cnt_cycles/,\
> +uncore_dmc_0_6/cnt_cycles/,\
> +uncore_dmc_0_7/cnt_cycles/ sleep 1
> +
> +perf stat -a -e \
> +uncore_dmc_0_0/cancelled_read_txns/,\
> +uncore_dmc_0_0/cnt_cycles/,\
> +uncore_dmc_0_0/consumed_read_txns/,\
> +uncore_dmc_0_0/data_transfers/ sleep 1
> +
> +perf stat -a -e \
> +uncore_l3c_0_0/l3_retry/,\
> +uncore_l3c_0_0/read_hit/,\
> +uncore_l3c_0_0/read_request/,\
> +uncore_l3c_0_0/inv_request/ sleep 1
> +
> +The driver does not support sampling, therefore "perf record" will
> +not work. Per-task (without "-a") perf sessions are not supported.
> 


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
