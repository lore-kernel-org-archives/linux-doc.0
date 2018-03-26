Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0856E7DD31
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 19:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751157AbeCZTjJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 15:39:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45194 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751024AbeCZTjH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Mar 2018 15:39:07 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2QJZVxL105146
        for <linux-doc@vger.kernel.org>; Mon, 26 Mar 2018 15:39:07 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gy4nexdgf-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 26 Mar 2018 15:39:07 -0400
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <bauerman@linux.vnet.ibm.com>;
        Mon, 26 Mar 2018 15:39:05 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
        by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 26 Mar 2018 15:38:59 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2QJcxBD51642584;
        Mon, 26 Mar 2018 19:38:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D5D9511205F;
        Mon, 26 Mar 2018 15:37:52 -0400 (EDT)
Received: from morokweng.localdomain (unknown [9.85.155.225])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS id DEACE112065;
        Mon, 26 Mar 2018 15:37:48 -0400 (EDT)
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com> <1519264541-7621-5-git-send-email-linuxram@us.ibm.com> <00081300-e891-3381-3acd-e3312e54fb58@intel.com>
User-agent: mu4e 1.0; emacs 25.3.1
From:   Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Ram Pai <linuxram@us.ibm.com>, shuahkh@osg.samsung.com,
        linux-kselftest@vger.kernel.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mingo@redhat.com,
        akpm@linux-foundation.org, benh@kernel.crashing.org,
        paulus@samba.org, khandual@linux.vnet.ibm.com,
        aneesh.kumar@linux.vnet.ibm.com, bsingharora@gmail.com,
        hbabu@us.ibm.com, mhocko@kernel.org, ebiederm@xmission.com,
        arnd@arndb.de
Subject: Re: [PATCH v12 04/22] selftests/vm: typecast the pkey register
In-reply-to: <00081300-e891-3381-3acd-e3312e54fb58@intel.com>
Date:   Mon, 26 Mar 2018 16:38:51 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18032619-0008-0000-0000-000002EB368B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008748; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01008802; UDB=6.00513843; IPR=6.00788084;
 MB=3.00020253; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-26 19:39:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032619-0009-0000-0000-000038B00FE8
Message-Id: <87h8p239v8.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-26_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803260199
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Dave Hansen <dave.hansen@intel.com> writes:

> On 02/21/2018 05:55 PM, Ram Pai wrote:
>> -static inline unsigned int _rdpkey_reg(int line)
>> +static inline pkey_reg_t _rdpkey_reg(int line)
>>  {
>> -	unsigned int pkey_reg = __rdpkey_reg();
>> +	pkey_reg_t pkey_reg = __rdpkey_reg();
>>
>> -	dprintf4("rdpkey_reg(line=%d) pkey_reg: %x shadow: %x\n",
>> +	dprintf4("rdpkey_reg(line=%d) pkey_reg: %016lx shadow: %016lx\n",
>>  			line, pkey_reg, shadow_pkey_reg);
>>  	assert(pkey_reg == shadow_pkey_reg);
>
> Hmm.  So we're using %lx for an int?  Doesn't the compiler complain
> about this?

It doesn't because dprintf4() doesn't have the annotation that tells the
compiler that it takes printf-like arguments. Once I add it:

--- a/tools/testing/selftests/vm/pkey-helpers.h
+++ b/tools/testing/selftests/vm/pkey-helpers.h
@@ -54,6 +54,10 @@
 #define DPRINT_IN_SIGNAL_BUF_SIZE 4096
 extern int dprint_in_signal;
 extern char dprint_in_signal_buffer[DPRINT_IN_SIGNAL_BUF_SIZE];
+
+#ifdef __GNUC__
+__attribute__((format(printf, 1, 2)))
+#endif
 static inline void sigsafe_printf(const char *format, ...)
 {
 	va_list ap;

Then it does complain about it. I'm working on a fix where each arch
will define a format string to use for its pkey_reg_t and use it like
this:

--- a/tools/testing/selftests/vm/pkey-helpers.h
+++ b/tools/testing/selftests/vm/pkey-helpers.h
@@ -19,6 +19,7 @@
 #define u32 uint32_t
 #define u64 uint64_t
 #define pkey_reg_t u32
+#define PKEY_REG_FMT "%016x"

 #ifdef __i386__
 #ifndef SYS_mprotect_key
@@ -112,7 +113,8 @@ static inline pkey_reg_t _read_pkey_reg(int line)
 {
 	pkey_reg_t pkey_reg = __read_pkey_reg();

-	dprintf4("read_pkey_reg(line=%d) pkey_reg: %016lx shadow: %016lx\n",
+	dprintf4("read_pkey_reg(line=%d) pkey_reg: "PKEY_REG_FMT
+			" shadow: "PKEY_REG_FMT"\n",
 			line, pkey_reg, shadow_pkey_reg);
 	assert(pkey_reg == shadow_pkey_reg);

--
Thiago Jung Bauermann
IBM Linux Technology Center

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
